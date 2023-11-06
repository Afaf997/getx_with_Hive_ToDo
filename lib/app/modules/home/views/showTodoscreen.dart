import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todo_with_getx/app/modules/home/controllers/modecontroller.dart';
import 'package:todo_with_getx/app/modules/home/controllers/todocontroller.dart';

class ShowTodo extends StatelessWidget {
  final TodoController todocontroller = Get.put(TodoController());
  final ViewModeController viewModeController = Get.put(ViewModeController());

   ShowTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(14),
                child: Text(
                  'todo_list',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Obx(() {
            return todocontroller.todosBox.isEmpty
                ? const Padding(
                    padding: EdgeInsets.only(top: 140),
                    child: Center(
                      child: SizedBox(
                        height: 220,
                        width: 220,
                      ),
                    ),
                  )
                : Expanded(
                    child: Obx(() {
                      return ListView.builder(
                        itemCount: todocontroller.todosBox.length,
                        itemBuilder: (context, index) {
                          final toDomodel = todocontroller.todosBox[index];
                          return Slidable(
                            endActionPane: ActionPane(
                              motion: const DrawerMotion(),
                                  children: [
                                GetBuilder<TodoController>(
                                  builder: (todoController) {
                                    return SlidableAction(
                                      backgroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: "Delete",
                                      onPressed: (context) =>  todoController.deleteTodo(toDomodel),
                                    
                                    );
                                  },
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(13),
                              child: SizedBox(
                                height: 100,
                                child: Card(
                                  color: const Color.fromARGB(255, 232, 236, 233),
                                  shadowColor: const Color.fromARGB(255, 8, 5, 17),
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      toDomodel.title,
                                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                                    ),
                                    subtitle: Text(
                                      toDomodel.desctription,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    trailing: IconButton(
                                      onPressed: () {
                                        todocontroller.startEditing(toDomodel);
                                      },
                                      icon: const Icon(Icons.edit),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  );
          }),
        ],
      ),
    );
  }
}