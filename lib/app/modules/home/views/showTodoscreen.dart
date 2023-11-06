import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:todo_with_getx/app/modules/home/controllers/modecontroller.dart';
import 'package:todo_with_getx/app/modules/home/controllers/todocontroller.dart';

class ShowTodo extends StatelessWidget {
  @override
 

  final TodoController todoListController = Get.put(TodoController());
  final ViewModeController viewModeController = Get.put(ViewModeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(24),
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
              return todoListController.todosBox.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 140),
                      child: Center(
                        child: SizedBox(
                          height: 220,
                          width: 220,
                          child: Lottie.asset(
                            'assets/animation/empty.json',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      child: Obx(() {
                        return viewModeController.isGridView
                            ? GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemCount: todoListController.todosBox.length,
                                itemBuilder: (context, index) {
                                  final toDo = todoListController.todosBox[index];
                                  return Slidable(
                                    endActionPane: ActionPane(
                                      motion: const DrawerMotion(),
                                      children: [
                                        SlidableAction(
                                          backgroundColor: Colors.white,
                                          icon: Icons.delete,
                                          label: "Delete",
                                          onPressed: (context) {
                                            // todoListController.deleteTodo(toDo);
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
                                            title: Text(toDo.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                                            ),
                                            subtitle: Text(toDo.desctription, style: const TextStyle(fontSize: 15),
                                            ),
                                            trailing: IconButton(
                                              onPressed: () {
                                                // Implement your edit functionality here
                                              },
                                              icon: const Icon(Icons.edit),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : ListView.builder(
                                itemCount: todoListController.todosBox.length,
                                itemBuilder: (context, index) {
                                  final toDo = todoListController.todosBox[index];
                                  return Slidable(
                                    endActionPane: ActionPane(
                                      motion: const DrawerMotion(),
                                      children: [
                                        SlidableAction(
                                          backgroundColor: Colors.white,
                                          icon: Icons.delete,
                                          label: "Delete",
                                          onPressed: (context) {
                                            todoListController.deleteTodo(toDo);
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
                                            title: Text(toDo.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                                            ),
                                            subtitle: Text(toDo.desctription, style: const TextStyle(fontSize: 15),
                                            ),
                                            trailing: IconButton(
                                              onPressed: () {
                                                // Implement your edit functionality here
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
      ),
    );
  }
}