import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_with_getx/app/data/moduls/todo_modul.dart';
import 'package:todo_with_getx/app/modules/notes/controllers/notescontroller.dart';

void editingpage( BuildContext context,NotesModel todo) {
  final titleController = TextEditingController(text: todo.title);
  final notesController = Get.find<NotesController>();


  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
           leading: IconButton(
            onPressed: () {

              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color here
          ),
          backgroundColor: Colors.white,

          actions: [IconButton(onPressed: (){
              
               notesController.updateNotesList(
                todo,titleController.text  
              );
               Navigator.of(context).pop();
          }, 
          icon:Icon(Icons.check,color: Colors.black,)
          )
          ],
        ),
          body:Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  maxLength: null,
                  controller: titleController,
                  decoration: const InputDecoration(hintText: 'Note',),
                ),
              ],
            ),
          ),
        
      );
    },
  );
}