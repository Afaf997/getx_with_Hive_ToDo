import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_with_getx/app/modules/home/controllers/Notes_controller.dart';
import 'package:todo_with_getx/app/modules/home/controllers/maincontroller.dart';
import 'package:todo_with_getx/app/modules/home/controllers/todocontroller.dart';
import 'package:todo_with_getx/app/modules/home/views/showTodoscreen.dart';
import 'package:todo_with_getx/app/modules/home/views/showNotes.dart';

class ListDetailsWidget extends StatelessWidget {
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();

  final todoController = Get.find<TodoController>();
  final notesController = Get.find<NotesController>();
  final mainController = Get.find<MainController>();
  final PageController _pageController = PageController(initialPage: 0);

  ListDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 235, 243),
      body: Column(
        children: [
          CustomNavigationBar(mainController: mainController, pageController: _pageController),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                ShowTodo(),
                ShowNotes(),
              ],
              onPageChanged: (index) {
                mainController.changeSelectedIndex(index);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (mainController.selectedIndex.index.value == 0) {
            todoController.addTodoList(
              titleController.text,
              subtitleController.text,
            );
          } else {
            notesController.addNotesList(
              titleController.text,
            );
          }
        },
        backgroundColor: const Color.fromARGB(255, 5, 14, 27),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  final MainController mainController;
  final PageController pageController;

  CustomNavigationBar({required this.mainController, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Row(
        children: [
          IconButton(
            icon: Icon(CupertinoIcons.book),
            onPressed: () {
              mainController.changeSelectedIndex(0);
              pageController.jumpToPage(0);
            },
          ),
          IconButton(
            icon: Icon(CupertinoIcons.list_dash),
            onPressed: () {
              mainController.changeSelectedIndex(1);
              pageController.jumpToPage(1);
            },
          ),
        ],
      ),
    );
  }
}