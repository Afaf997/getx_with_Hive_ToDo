import 'package:get/get.dart';
import 'package:todo_with_getx/app/modules/home/controllers/maincontroller.dart';
import 'package:todo_with_getx/app/modules/home/controllers/modecontroller.dart';
import 'package:todo_with_getx/app/modules/home/controllers/todocontroller.dart';
import 'package:todo_with_getx/app/modules/notes/controllers/notescontroller.dart';

// import '../controllers/Notes_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TodoController());
    Get.put(MainController());
    Get.put(NotesController());
    Get.put(ViewModeController());

  }
}
