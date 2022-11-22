import 'package:crudapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///initialize TextEditingController called [_dataEntryController]
  ///List of [data] = []
  final TextEditingController _dataEntryController = TextEditingController();
  List<dynamic> data = [];
  bool _isLoading = true;

  ///[getData] get data functionality
  Future<List<dynamic>> getData() async {
    final res = await client
        .from('crudapp')
        .select('*')
        .eq('user_id', client.auth.currentUser!.id)
        .order('id');

    return res;
  }

  ///[addData] add/insert data functionality
  Future<void> addData({
    required final dataEntry,
  }) async {
    final res = await client.from('crudapp').insert(
        {'user_id': client.auth.currentUser!.id, 'data_entry': dataEntry});

    return res;
  }

  ///[updateData] update/edit data functionality
  Future<void> updateData({
    required final id,
    required final dataEntry,
  }) async {
    final res = await client
        .from('crudapp')
        .update({'data_entry': dataEntry}).eq('id', id);

    return res;
  }

  ///[deleteData] delete/remove data functionality
  Future<void> deleteData({
    required final id,
  }) async {
    try {
      await client.from('crudapp').delete().eq('id', id);
    } on AuthException catch (error) {
      context.showSnackBar(error.message);
    }
  }

  ///[initList] initialize the list of data
  Future<void> initList() async {
    List<dynamic> value = await getData();

    for (dynamic element in value) {
      data.add(element);
    }
    setState(() {
      _isLoading = false;
    });
  }

  ///[initState] override this initState function
  @override
  void initState() {
    initList();
    super.initState();
  }

  ///[dispose] override this dispose function
  @override
  void dispose() {
    _dataEntryController.dispose();
    super.dispose();
  }

  ///Dialog
  Future<void> _showDialog({
    required BuildContext context,
    void Function()? onTap,
    required TextEditingController dataEntry,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Your Data'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                TextField(
                  controller: _dataEntryController,
                  decoration: const InputDecoration(
                    labelText: 'Data',
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
        title: const Text('Simple CRUD App'),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () async {
                setState(() {
                  _isLoading = true;
                });
                List<dynamic> value = await getData();
                data.clear();
                for (dynamic element in value) {
                  data.add(element);
                }
                setState(() {
                  _isLoading = false;
                });
              },
              child: const Icon(Icons.refresh),
            ),
          )
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ConstrainedBox(
              constraints: const BoxConstraints(),
              child: data.isEmpty
                  ? const Center(
                      child: Text('No data entry'),
                    )
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ExpansionTile(
                          leading: const Icon(Icons.dataset),
                          title: Text(
                            data[index]['data_entry'],
                          ),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () async {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    deleteData(
                                      id: data[index]['id'],
                                    );

                                    List<dynamic> value = await getData();
                                    data.clear();
                                    for (dynamic element in value) {
                                      data.add(element);
                                    }

                                    setState(() {
                                      _isLoading = false;
                                    });
                                  },
                                  child: const Text('Delete'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _showDialog(
                                        context: context,
                                        dataEntry: _dataEntryController,
                                        onTap: () async {
                                          updateData(
                                            id: data[index]['id'],
                                            dataEntry:
                                                _dataEntryController.text,
                                          );
                                          _dataEntryController.clear();
                                          Navigator.pop(context);
                                          setState(() {
                                            _isLoading = true;
                                          });
                                          List<dynamic> value = await getData();
                                          data.clear();
                                          for (dynamic element in value) {
                                            data.add(element);
                                          }
                                          setState(() {
                                            _isLoading = false;
                                          });
                                        });
                                  },
                                  child: const Text('Edit'),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog(
            context: context,
            dataEntry: _dataEntryController,
            onTap: () async {
              setState(() {
                _isLoading = true;
              });
              addData(
                dataEntry: _dataEntryController.text,
              );

              _dataEntryController.clear();

              Navigator.pop(context);

              List<dynamic> value = await getData();
              data.clear();
              for (dynamic element in value) {
                data.add(element);
              }

              setState(() {
                _isLoading = false;
              });
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
