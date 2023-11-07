import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todo_with_getx/app/modules/home/controllers/modecontroller.dart';
import 'package:todo_with_getx/app/modules/notes/controllers/notescontroller.dart';
import 'package:todo_with_getx/app/modules/notes/views/notes_details.dart';
import 'package:todo_with_getx/app/modules/notes/views/notes_editing.dart';

class ShowNotes extends StatelessWidget {
  final NotesController notesController = Get.put(NotesController());
  final ViewModeController viewModeController = Get.put(ViewModeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top:70,left: 20),
                child: Text(
                  'Notes-Bucket',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Obx(() {
            return Expanded(
              child: ListView.builder(
                itemCount: notesController.notesBox.length,
                itemBuilder: (context, index) {
                  final toDo = notesController.notesBox[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NoteDetailPage(toDo.title),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 1,
                      margin: const EdgeInsets.only(left: 12, right: 12, top: 10),
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
                        startActionPane: ActionPane(
                          motion: DrawerMotion(),
                          children: [
                            SlidableAction(
                              backgroundColor: Colors.blue,
                              icon: Icons.edit,
                              label: "Update",
                              onPressed: (context) {
                                // Edit note
                                editNotesItem(context, toDo, notesController);
                              },
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(
                            toDo.title,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}