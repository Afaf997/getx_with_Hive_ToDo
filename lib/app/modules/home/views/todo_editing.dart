import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditPage extends StatelessWidget {
  final TextEditingController titleController;
  final String initialTitle;

  EditPage({required this.titleController, required this.initialTitle});

  @override
  Widget build(BuildContext context) {
    titleController.text = initialTitle; // Set the initial title

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: 'Edit the title'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, titleController.text); // Return the new title
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}