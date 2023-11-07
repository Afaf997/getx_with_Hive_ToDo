import 'package:flutter/material.dart';
import 'package:todo_with_getx/app/data/moduls/todo_modul.dart';
import 'package:todo_with_getx/app/modules/notes/controllers/notescontroller.dart';

void editNotesItem(
  BuildContext context,
  NotesModel notesModel, // Pass the selected notesModel
  NotesController notesController,
) {
  final titleController = TextEditingController(text: notesModel.title);

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
                notesController.updateTodoList(
                  notesModel,
                  titleController.text,
                );
                Navigator.pop(context);
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
              Text("Title", style: TextStyle(fontSize: 23, color: Colors.grey),
              ),
              TextField(
                maxLength: null,
                controller: titleController,
                decoration: const InputDecoration(hintText: 'Note'),
              ),
            ],
          ),
        ),
      );
    },
  );
}