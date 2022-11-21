import 'package:flutter/material.dart';

class Diary extends StatelessWidget {
  void Function()? onTap;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  Diary({
    super.key,
    required titleController,
    required bodyController,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Diary'),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
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
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: onTap,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
