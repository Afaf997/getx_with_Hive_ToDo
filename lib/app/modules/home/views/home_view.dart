import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_with_getx/app/modules/home/controllers/maincontroller.dart';
import 'package:todo_with_getx/app/modules/home/controllers/modecontroller.dart';
import 'package:todo_with_getx/app/modules/home/controllers/todocontroller.dart';
import 'package:todo_with_getx/app/modules/home/views/showTodoscreen.dart';
import 'package:todo_with_getx/app/modules/home/views/todomodel.dart';
import 'package:todo_with_getx/app/modules/notes/controllers/notescontroller.dart';
import 'package:todo_with_getx/app/modules/notes/views/notes_list.dart';
import 'package:todo_with_getx/app/modules/notes/views/show_Notes.dart';

class ListDetailsWidget extends StatelessWidget {
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final todoController = Get.find<TodoController>();
  final notesController = Get.find<NotesController>();
  final mainController = Get.find<MainController>();

  ListDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _buildPage(mainController.selectedIndex.index.value),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (mainController.selectedIndex.index.value == 0) {
            addTodoItem(todoController, context);
          } else {
            addNotesItem(notesController, context);
          }
        },
        backgroundColor: const Color.fromARGB(255, 241, 186, 104),
        child: const Icon(Icons.add),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: mainController.selectedIndex.index.value,
        onTap: (int index) {
          mainController.changeSelectedIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.today,color: Color.fromARGB(255, 115, 114, 114),size: 35),
            label: 'Todo',
            

          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.doc_checkmark_fill,color:  Color.fromARGB(255, 115, 114, 114),size: 35,),
            label: 'Notes',
          ),
        ],
      ),

    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return ShowTodo();
      case 1:
        return ShowNotes();
      default:
        return Container(); // Add your default content or error handling here.
    }
  }
}


