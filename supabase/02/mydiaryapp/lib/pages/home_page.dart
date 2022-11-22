import 'package:flutter/material.dart';
import 'package:mydiaryapp/utils/utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

///initialize
///TextEditingController for title and body
///_isLoading for loading
///List diaries that will hold the date
class _HomePageState extends State<HomePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  bool _isLoading = true;
  List<dynamic> diaries = [];

  ///[getDiaries] it will get the diaries
  Future<List<dynamic>> getDiaries() async {
    final result = await client
        .from('diaries')
        .select('*')
        .eq('user_id', client.auth.currentUser!.id)
        .order('id');

    return result;
  }

  ///[addDiary] a function that add diary
  Future<void> addDiary({
    required final title,
    required final body,
  }) async {
    final result = await client.from('diaries').insert({
      'user_id': client.auth.currentUser!.id,
      'title_diary': title,
      'body_diary': body,
    });

    return result;
  }

  ///[editDiary] a function that edit/update diary
  Future<void> editDiary({
    required final id,
    required final title,
    required final body,
  }) async {
    final result = await client
        .from('diaries')
        .update({'title_diary': title, 'body_diary': body}).eq('id', id);

    return result;
  }

  ///[deleteDiary] function that will delete diary
  Future<void> deleteDiary({
    required final id,
  }) async {
    try {
      await client.from('diaries').delete().eq('id', id);
    } on AuthException catch (error) {
      context.showErrorSnackBar(error.message);
    }
  }

  ///[initListFunc] initial the List of diaries
  Future<void> initListFunc() async {
    List<dynamic> value = await getDiaries();
    for (dynamic element in value) {
      diaries.add(element);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    initListFunc();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  Future<void> _showDialog({
    required BuildContext context,
    void Function()? onTap,
    required TextEditingController titleController,
    required TextEditingController bodyController,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Diary'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                  ),
                ),
                TextField(
                  controller: bodyController,
                  decoration: const InputDecoration(
                    hintText: 'Body',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: onTap,
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: InkWell(
          onTap: () {
            client.auth.signOut();
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          },
          child: const Icon(Icons.logout),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () async {
                setState(() {
                  _isLoading = true;
                });
                List<dynamic> value = await getDiaries();
                diaries.clear();
                for (dynamic element in value) {
                  diaries.add(element);
                }
                setState(() {
                  _isLoading = false;
                });
              },
              child: const Icon(
                Icons.refresh,
              ),
            ),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            )
          : ConstrainedBox(
              constraints: const BoxConstraints(),
              child: diaries.isEmpty
                  ? const Center(
                      child: Text('No Entry'),
                    )
                  : ListView.builder(
                      itemCount: diaries.length,
                      itemBuilder: (context, index) {
                        return ExpansionTile(
                          childrenPadding: const EdgeInsets.only(
                            top: 10,
                            right: 20,
                            left: 20,
                            bottom: 10,
                          ),
                          leading: const Icon(Icons.book),
                          title: Text(
                            diaries[index]['title_diary'],
                          ),
                          children: [
                            Text(
                              diaries[index]['body_diary'],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0,
                                    ),
                                    child: OutlinedButton(
                                      onPressed: () async {
                                        setState(() {
                                          _isLoading = true;
                                        });
                                        deleteDiary(
                                          id: diaries[index]['id'],
                                        );
                                        List<dynamic> value =
                                            await getDiaries();
                                        diaries.clear();
                                        for (dynamic element in value) {
                                          diaries.add(element);
                                        }
                                        setState(() {
                                          _isLoading = false;
                                        });
                                      },
                                      child: const Text(
                                        'Delete',
                                        style: TextStyle(
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0,
                                    ),
                                    child: OutlinedButton(
                                      onPressed: () {
                                        _showDialog(
                                          context: context,
                                          titleController: _titleController,
                                          bodyController: _bodyController,
                                          onTap: () async {
                                            editDiary(
                                              id: diaries[index]['id'],
                                              title: _titleController.text,
                                              body: _bodyController.text,
                                            );
                                            _titleController.clear();
                                            _bodyController.clear();
                                            Navigator.pop(context);
                                            setState(() {
                                              _isLoading = true;
                                            });
                                            List<dynamic> value =
                                                await getDiaries();
                                            diaries.clear();
                                            for (dynamic element in value) {
                                              diaries.add(element);
                                            }
                                            setState(() {
                                              _isLoading = false;
                                            });
                                          },
                                        );
                                      },
                                      child: const Text(
                                        'Edit',
                                        style: TextStyle(
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          _showDialog(
              context: context,
              titleController: _titleController,
              bodyController: _bodyController,
              onTap: () async {
                setState(() {
                  _isLoading = true;
                });
                addDiary(
                  title: _titleController.text,
                  body: _bodyController.text,
                );
                _titleController.clear();
                _bodyController.clear();
                Navigator.pop(context);
                List<dynamic> value = await getDiaries();
                diaries.clear();
                for (dynamic element in value) {
                  diaries.add(element);
                }
                setState(() {
                  _isLoading = false;
                });
              });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
