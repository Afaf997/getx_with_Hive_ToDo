import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:todo_with_getx/app/modules/home/controllers/modecontroller.dart';
import 'package:todo_with_getx/app/modules/home/controllers/Notes_controller.dart';
import 'package:todo_with_getx/app/modules/home/views/notes_editing_screen.dart';

class ShowNotes extends StatelessWidget {
  final NotesController notesController = Get.put(NotesController());
  final ViewModeController viewModeController = Get.put(ViewModeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Colors.white,
        title: Text('Notes_bucket',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 23),),
      ),
      body: Obx(() {
        return Column(
          children: <Widget>[
            if (notesController.notesBox.isEmpty)
              const Center(
                child: CircularProgressIndicator(),
              )
            else
              Expanded(
                child: viewModeController.isGridView
                    ? GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
  ),
  itemCount: notesController.notesBox.length,
  itemBuilder: (context, index) {
    final toDo = notesController.notesBox[index];
    return Card(
      color: Color.fromARGB(255, 235, 233, 227),
      child: ListTile(
        title: Text(
          toDo.title,
          maxLines: null,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'edit') {
              //  todoListViewModel.updateTodoList(
              //         todo,
              //         titleController.text,
              //         descriptionController.text,
              //       );

            } else if (value == 'remove') {
              notesController.deleteTodo(toDo);
            }
          },
          itemBuilder: (BuildContext context) {
            return ['edit', 'remove'].map((String option) {
              return PopupMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList();
          },
        ),
      ),
    );
  },
)
                    : ListView.builder(
                        itemCount: notesController.notesBox.length,
                        itemBuilder: (context, index) {
                          final toDo = notesController.notesBox[index];
                          return Card( 
                             margin: EdgeInsets.only(left: 10,right: 10,top: 8),
                            child: Slidable(
                              endActionPane: ActionPane(
                                motion: DrawerMotion(),
                                children: [
                                  SlidableAction(
                                    backgroundColor: Colors.red,
                                    icon: Icons.delete,
                                    label: "Delete",
                                    onPressed: (context) {
                                      notesController.deleteTodo(toDo);
                                    },
                                  ),
                                ],
                              ),
                              child: ListTile(
                                title: Text(
                                  toDo.title,
                                  maxLines: null,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
          ],
        );
      }),
    );
  }
}