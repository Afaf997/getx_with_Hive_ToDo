import 'package:flutter/material.dart';

void addNotesItem(todoListViewModel, BuildContext context) {
  final titleController = TextEditingController();

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
               todoListViewModel.addNotesList(
               titleController.text,);
               Navigator.of(context).pop();
          }, 
          icon:Icon(Icons.check,color: Colors.black,))],
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