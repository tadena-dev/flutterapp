import 'package:flutter/material.dart';
import 'package:listapp/model/list.dart';

//Create Stateful Widget
class AddListPage extends StatefulWidget {
  const AddListPage({super.key});

  @override
  State<AddListPage> createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
  //Create a TextEditingController
  late final TextEditingController _firstnameController;
  late final TextEditingController _lastnameController;
  late final TextEditingController _addressController;

  //Create initState function for controllers
  @override
  void initState() {
    _firstnameController = TextEditingController();
    _lastnameController = TextEditingController();
    _addressController = TextEditingController();
    super.initState();
  }

  //Create dispose function for controllers
  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  //In build widget
  //Replace Container with Scaffold
  // appBar:
  // body:
  // floatingActionButton
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add List'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTextFormField(
              controller: _firstnameController,
              hintText: 'First Name',
            ),
            buildTextFormField(
              controller: _lastnameController,
              hintText: 'Last Name',
            ),
            buildTextFormField(
              controller: _addressController,
              hintText: 'Address',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final info = Info(
            firstname: _firstnameController.text,
            lastname: _lastnameController.text,
            address: _addressController.text,
          );
          InfoList().add(info: info);
          //Navigate to homepage
          Navigator.of(context).pop();
        },
        backgroundColor: Colors.blueGrey,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildTextFormField({
    required final controller,
    required final hintText,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}
