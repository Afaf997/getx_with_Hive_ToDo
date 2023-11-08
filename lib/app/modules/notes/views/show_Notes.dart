import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todo_with_getx/app/modules/home/controllers/modecontroller.dart';
import 'package:todo_with_getx/app/modules/notes/controllers/notescontroller.dart';
import 'package:todo_with_getx/app/modules/notes/views/notes_details.dart';
import 'package:todo_with_getx/app/modules/notes/views/notes_editing.dart';
import 'package:lottie/lottie.dart';

class ShowNotes extends StatelessWidget {
  final NotesController notesController = Get.find<NotesController>();
  final ViewModeController viewModeController = Get.find<ViewModeController>();

  ShowNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 70, left: 20),
                child: Text(
                  'Notes-Bucket',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Obx(() {
            if (notesController.notesBox.isEmpty) {
              return Padding(
                padding: EdgeInsets.only(top: 170),
                child: Center(
                  child: SizedBox(
                    height: 220,
                    width: 220,
                    child: Lottie.asset(
                      'assets/images/animation.json',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            } else {
              return Expanded(
                child: ListView.builder(
                  itemCount: notesController.notesBox.length,
                  itemBuilder: (context, index) {
                    final toDo = notesController.notesBox[index];
                    return GestureDetector(
                      onDoubleTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NoteDetailPage(toDo.title),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 0.3,
                        margin: const EdgeInsets.only(left: 12, right: 12, top: 17),
                        child: Slidable(
                          endActionPane: ActionPane(
                            motion: const DrawerMotion(),
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
                                  editingpage(context, toDo);
                                },
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(
                              toDo.title,
                              maxLines: null,
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
            }
          }),
        ],
      ),
    );
  }
}