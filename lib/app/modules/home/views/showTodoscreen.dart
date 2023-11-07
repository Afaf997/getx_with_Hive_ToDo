import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_with_getx/app/modules/home/controllers/modecontroller.dart';
import 'package:todo_with_getx/app/modules/home/controllers/todocontroller.dart';
import 'package:todo_with_getx/widget/grid-mode-function.dart';
import 'package:todo_with_getx/widget/list_model_function.dart';

class ShowTodo extends StatelessWidget {
  final TodoController todoController = Get.find<TodoController>();
  final viewModeController =Get.find<ViewModeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 35, left: 20),
                  child: Text(
                    'Todo_List',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 200, top: 17),
                  child: Obx(() {
                    return IconButton(
                        onPressed: () => viewModeController.toggleViewMode(),
                        icon: viewModeController.isGridView
                            ? const Icon(Icons.table_rows_rounded)
                            : const Icon(Icons.grid_view_outlined));
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
                            ? buildMasonryGridView()
                            : buildSlidableListView();
                      }),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
