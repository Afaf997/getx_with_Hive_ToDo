import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todo_with_getx/app/modules/home/controllers/todocontroller.dart';
import 'package:todo_with_getx/app/modules/home/views/todo_editing.dart';

Widget buildSlidableListView() {
  final TodoController todoController = Get.find<TodoController>();
  return Padding(
    padding: EdgeInsets.only(top: 23),
    child: ListView.separated(
      itemCount: todoController.todosBox.length,
      separatorBuilder: (context, index) =>
          const Divider(), // Add a separator between items
      itemBuilder: (context, index) {
        final toDo = todoController.todosBox[index];
        return Slidable(
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                backgroundColor: Colors.white,
                icon: Icons.delete,
                label: "Delete",
                onPressed: (context) => todoController.deleteTodo(toDo),
              ),
            ],
          ),
            startActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                backgroundColor: Colors.white,
                icon: Icons.edit,
                label: "edit",
                onPressed: (context) =>  editTodoItem(context, toDo,todoController),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            title: Text(
              toDo.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            subtitle: Text(
              toDo.desctription,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        );
      },
    ),
  );
}
