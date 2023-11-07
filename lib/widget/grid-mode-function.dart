import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:todo_with_getx/app/modules/home/controllers/todocontroller.dart';

Widget buildMasonryGridView() {
  final TodoController todoController = Get.find<TodoController>();
  return MasonryGridView.builder(
    gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    ),
    itemCount: todoController.todosBox.length,
    itemBuilder: (context, index) {
      final toDo = todoController.todosBox[index];
      return buildMasonryGridItem(toDo);
    },
  );
}

Widget buildMasonryGridItem(toDo) {
  return Padding(
    padding: const EdgeInsets.only(left:6,right: 6,top: 25),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: const Color.fromARGB(255, 232, 236, 233),
        child: ListTile(
          title: Text(
            toDo.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          subtitle: Text(
            toDo.desctription,
            style: const TextStyle(fontSize: 16, height: 1.5),
          ),
        ),
      ),
    ),
  );
}
