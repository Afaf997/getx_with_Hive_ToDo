// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:get/get.dart';
// import 'package:todo_with_getx/app/modules/home/controllers/modecontroller.dart';
// import 'package:todo_with_getx/app/modules/home/controllers/todocontroller.dart';

// class ShowTodo extends StatelessWidget {
//   final TodoController todoController = Get.put(TodoController());
//   final ViewModeController viewModeController = Get.put(ViewModeController());



//   void toggleViewMode() {
//     viewModeController.toggleViewMode();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Row(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(top:70),
//                 child: Text(
//                   'todo_list',
//                   style: TextStyle(
//                     fontSize: 23,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: toggleViewMode,
//                 child: Text(viewModeController.isGridView ? 'List View' : 'Grid View'),
//               ),
//             ],
//           ),
//           Obx(() {
//             return todoController.todosBox.isEmpty
//                 ? const Padding(
//                     padding: EdgeInsets.only(top: 140),
//                     child: Center(
//                       child: SizedBox(
//                         height: 220,
//                         width: 220,
//                       ),
//                     ),
//                   )
//                 : Expanded(
//                     child: Obx(() {
//                       return viewModeController.isGridView
//                           ? GridView.builder(
//   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 2,
//   ),
//   itemCount: todoController.todosBox.length,
//   itemBuilder: (context, index) {
//     final toDomodel = todoController.todosBox[index];
//     return Slidable(
//       endActionPane: ActionPane(
//         motion: const DrawerMotion(),
//         children: [
//           SlidableAction(
//             backgroundColor: Colors.white,
//             icon: Icons.delete,
//             label: "Delete",
      
//             onPressed:(context) => todoController.deleteTodo(toDomodel) ,
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(13),
//         child: SizedBox(
//           height: 150,
//           width: 150, 
//           child: Card(
//             color: const Color.fromARGB(255, 232, 236, 233),
//             shadowColor: const Color.fromARGB(255, 8, 5, 17),
//             elevation: 2,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(6),
//             ),
//             child: ListTile(
//               title: Text(
//                 toDomodel.title,
//                 style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
//               ),
//               subtitle: Text(
//                 toDomodel.desctription,
//                 style: const TextStyle(fontSize: 15),
//               ),
//               trailing: IconButton(
//                 onPressed: () {
//                   todoController.startEditing(toDomodel);
//                 },
//                 icon: const Icon(Icons.edit),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   },
// )
//                           : ListView.builder(
//                               itemCount: todoController.todosBox.length,
//                               itemBuilder: (context, index) {
//                                 final toDomodel = todoController.todosBox[index];
//                                 return Slidable(
//                                   endActionPane: ActionPane(
//                                     motion: const DrawerMotion(),
//                                     children: [
//                                       SlidableAction(
//                                         backgroundColor: Colors.white,
//                                         icon: Icons.delete,
//                                         label: "Delete",
//                                         onPressed: (context) => todoController.deleteTodo(toDomodel),
//                                       ),
//                                     ],
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(13),
//                                     child: SizedBox(
//                                       height: 100,
//                                       child: Card(
//                                         // color: const Color fromARGB(255, 232, 236, 233),
//                                         // shadowColor: const Color fromARGB(255, 8, 5, 17),
//                                         elevation: 10,
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(6),
//                                         ),
//                                         child: ListTile(
//                                           title: Text(
//                                             toDomodel.title,
//                                             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
//                                           ),
//                                           subtitle: Text(
//                                             toDomodel.desctription,
//                                             style: const TextStyle(fontSize: 15),
//                                           ),
//                                           trailing: IconButton(
//                                             onPressed: () {
//                                               todoController.startEditing(toDomodel);
//                                             },
//                                             icon: const Icon(Icons.edit),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             );
//                     }),
//                   );
//           }),
//         ],
//       ),
//     );
//   }
// }
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
                  padding: EdgeInsets.all(24),
                  child: Text(
                    'Todo_List',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 200),
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
                                          onPressed: (context) =>todoController.deleteTodo(toDo) ,
                                          // onPressed: () {
                                          //   todoController.deleteTodo(toDo);
                                          // },

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