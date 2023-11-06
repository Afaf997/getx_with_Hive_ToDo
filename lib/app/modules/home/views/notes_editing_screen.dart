import 'package:flutter/material.dart';

void editNotesItem(
    todoListViewModel, BuildContext context, String currentTitle) {
  final titleController = TextEditingController(text: currentTitle);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                todoListViewModel.updateNotesList(
                  currentTitle, // Pass the current title
                  titleController.text, // Pass the updated title
                );
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.check, color: Colors.black),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title",
                style: TextStyle(fontSize: 23, color: Colors.grey),
              ),
              TextField(
                maxLength: null,
                controller: titleController,
                decoration: InputDecoration(hintText: 'Note'),
              ),
            ],
          ),
        ),
      );
    },
  );
}

