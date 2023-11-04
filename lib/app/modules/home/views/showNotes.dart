import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:todo_with_getx/app/modules/home/controllers/modecontroller.dart';
import 'package:todo_with_getx/app/modules/home/controllers/Notes_controller.dart';

class ShowNotes extends StatelessWidget {
  final NotesController notesController = Get.put(NotesController());
  final ViewModeController viewModeController = Get.put(ViewModeController());

  @override
  Widget build(BuildContext context) {
    void toggleViewMode() {
      viewModeController.toggleViewMode();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Notes_bucket'),
        actions: [
          IconButton(
            onPressed: toggleViewMode,
            icon: Obx(() {
              return viewModeController.isGridView
                  ? Icon(Icons.grid_view_outlined)
                  : Icon(Icons.table_rows_rounded);
            }),
          ),
        ],
      ),
      body: Obx(() {
        return Column(
          children: <Widget>[
            if (notesController.notesBox.isEmpty)
              Center(
                child: CircularProgressIndicator(),
              )
            else
              Expanded(
                child: viewModeController.isGridView
                    ? GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: notesController.notesBox.length,
                        itemBuilder: (context, index) {
                          final toDo = notesController.notesBox[index];
                          return Slidable(
                            endActionPane: ActionPane(
                              motion: DrawerMotion(),
                              children: [
                                SlidableAction(
                                  backgroundColor: Colors.red,
                                  icon: Icons.delete,
                                  label: "Delete",
                                  onPressed: (context) {
                                    // notesController.deleteNotes(toDo);
                                  },
                                ),
                              ],
                            ),
                            child: Card(
                              color: Color.fromARGB(255, 235, 233, 227),
                              child: ListTile(
                                title: Text(
                                  toDo.title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : ListView.separated(
                        itemCount: notesController.notesBox.length,
                        separatorBuilder: (context, index) => Divider(
                          height: 0.5,
                          color: Colors.grey,
                        ),
                        itemBuilder: (context, index) {
                          final toDo = notesController.notesBox[index];
                          return Slidable(
                            endActionPane: ActionPane(
                              motion: DrawerMotion(),
                              children: [
                                SlidableAction(
                                  backgroundColor: Colors.red,
                                  icon: Icons.delete,
                                  label: "Delete",
                                  onPressed: (context) {
                                    // notesController.deleteNotes(toDo);
                                  },
                                ),
                              ],
                            ),
                            child: ListTile(
                              title: Text(
                                toDo.title,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
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