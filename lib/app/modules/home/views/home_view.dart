import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_with_getx/app/modules/home/controllers/Notes_controller.dart';
import 'package:todo_with_getx/app/modules/home/controllers/maincontroller.dart';
import 'package:todo_with_getx/app/modules/home/controllers/modecontroller.dart';
import 'package:todo_with_getx/app/modules/home/controllers/todocontroller.dart';
import 'package:todo_with_getx/app/modules/home/views/noteslist.dart';
import 'package:todo_with_getx/app/modules/home/views/showTodoscreen.dart';
import 'package:todo_with_getx/app/modules/home/views/showNotes.dart';
import 'package:todo_with_getx/app/modules/home/views/todomodel.dart';

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
       addTodoItem(todoController, context);
    } else {
       addNotesItem(notesController, context);
    }
  },
  backgroundColor: const Color.fromARGB(255, 241, 186, 104),
  child: const Icon(Icons.add),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(7)), // Adjust the radius as needed
  ),
),

    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  final MainController mainController;
  final PageController pageController;

  CustomNavigationBar({required this.mainController, required this.pageController});
   final ViewModeController viewModeController = Get.put(ViewModeController());
  @override
  Widget build(BuildContext context) {
 return Container(
  height: 80,
  padding: const EdgeInsets.only(top: 17),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(CupertinoIcons.book, size: 28),
              onPressed: () {
                mainController.changeSelectedIndex(0);
                pageController.jumpToPage(0);
              },
            ),
            IconButton(
              icon: Icon(CupertinoIcons.list_dash, size: 28),
              onPressed: () {
                mainController.changeSelectedIndex(1);
                pageController.jumpToPage(1);
              },
            ),
          ],
        ),
      ),
    ],
  ),
);
  }
}