import 'package:flutter/material.dart';
import 'package:todo_with_getx/app/data/moduls/todo_modul.dart';
import 'package:todo_with_getx/app/modules/home/controllers/todocontroller.dart';



void editTodoItem(BuildContext context, TodoModel todo,
    TodoController todoListViewModel) {
  final titleController = TextEditingController(text: todo.title);
  final descriptionController = TextEditingController(text: todo.desctription);

  showModalBottomSheet(
    // backgroundColor: const Color.fromARGB(255, 212, 211, 211),
    backgroundColor: Color.fromARGB(255, 5, 26, 43),
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            // color:  Color.fromARGB(255, 5, 26, 43),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(13),
                child: TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                      hintText: "Title", border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13),
                child: TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                      hintText: "Description", border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 240, top: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    elevation: 5,
                  ),
                  onPressed: () {
                    todoListViewModel.updateTodoList(
                      todo,
                      titleController.text,
                      descriptionController.text,
                    );
                    Navigator.pop(context);
                  },
                  child: const Text("Update"),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}