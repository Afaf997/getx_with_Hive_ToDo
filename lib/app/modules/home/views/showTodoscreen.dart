
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todo_with_getx/app/modules/home/controllers/modecontroller.dart';
import 'package:todo_with_getx/app/modules/home/controllers/todocontroller.dart';

class ShowTodo extends StatelessWidget {
  final TodoController todoController = Get.find<TodoController>();

  final ViewModeController viewModeController = Get.put(ViewModeController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Padding(
                     padding: EdgeInsets.only(top:40,left: 20),
                  child: Text(
                    'Todo_List',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 200,top: 20),
                  child: Obx(() {
                    return IconButton(
                      onPressed: () => viewModeController.toggleViewMode(),
                      icon: viewModeController.isGridView
                          ? Icon(Icons.grid_view_outlined)
                          : Icon(Icons.table_rows_rounded),
                    );
                  }),
                ),
              ],
            ),
            Obx(() {
              return todoController.todosBox.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.only(top: 140),
                      child: Center(
                        // child: SizedBox(
                        //   height: 220,
                        //   width: 220,
                        //   child: Lottie.asset(
                        //     'assets/animation/empty.json',
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                      ),
                    )
                  : Expanded(
                      child: Obx(() {
                        return viewModeController.isGridView
                            ? GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemCount: todoController.todosBox.length,
                                itemBuilder: (context, index) {
                                  final toDo = todoController.todosBox[index];
                                  return Slidable(
                                    endActionPane: ActionPane(
                                      motion: DrawerMotion(),
                                      children: [
                                        SlidableAction(
                                          backgroundColor: Colors.white,
                                          icon: Icons.delete,
                                          label: "Delete",
                                          // onPressed: () {
                                          //   todoController.deleteTodo(toDo);
                                          // },
                                            onPressed: (context) =>todoController.deleteTodo(toDo) ,
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(13),
                                      child: SizedBox(
                                        height: 100,
                                        child: Card(
                                          color: Color.fromARGB(255, 232, 236, 233),
                                          shadowColor: Color.fromARGB(255, 8, 5, 17),
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: ListTile(
                                            title: Text(toDo.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                                            // subtitle: Text(toDo.description, style: TextStyle(fontSize: 15)),
                                            trailing: IconButton(
                                              onPressed: () {
                                                // Add the edit functionality
                                              },
                                              icon: Icon(Icons.edit),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                              : ListView.builder(
  itemCount: todoController.todosBox.length,
  itemBuilder: (context, index) {
    final toDo = todoController.todosBox[index];
    return Slidable(
      endActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            backgroundColor: Colors.white,
            icon: Icons.delete,
            label: "Delete",
            onPressed: (context) => todoController.deleteTodo(toDo),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), // Padding for the ListTile content
          tileColor: Color.fromARGB(255, 224, 235, 246),
          title: Text(
            toDo.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          subtitle: Text(toDo.desctription, style: TextStyle(fontSize: 15)),
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