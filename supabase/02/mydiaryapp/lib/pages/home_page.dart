import 'package:flutter/material.dart';
import 'package:mydiaryapp/pages/diary_page.dart';
import 'package:mydiaryapp/utils/utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  bool _isLoading = true;
  List<dynamic> diaries = [];

  Future<List<dynamic>> getDiaries() async {
    final result = await client
        .from('diaries')
        .select('*')
        .eq('user_id', client.auth.currentUser!.id)
        .order('id');

    return result;
  }

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

  Future<void> deleteDiary({
    required final id,
  }) async {
    try {
      await client.from('diaries').delete().eq('id', id);
    } on AuthException catch (error) {
      context.showErrorSnackBar(error.message);
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                client.auth.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
              child: const Icon(
                Icons.logout,
              ),
            ),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
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
                            top: 5,
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
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  OutlinedButton(
                                    onPressed: () async {
                                      setState(() {
                                        _isLoading = true;
                                      });
                                      deleteDiary(
                                        id: diaries[index]['id'],
                                      );
                                      List<dynamic> value = await getDiaries();
                                      diaries.clear();
                                      for (dynamic element in value) {
                                        diaries.add(element);
                                      }
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    },
                                    child: const Text('Delete'),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/diary');
                                    },
                                    child: const Text('Edit'),
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
        onPressed: () {
          Diary(
            titleController: _titleController,
            bodyController: _bodyController,
            onTap: () {
              addDiary(
                title: _titleController.text,
                body: _bodyController.text,
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
