import 'package:get/get.dart';
import 'package:todo_with_getx/app/modules/home/controllers/Notes_controller.dart';
import 'package:todo_with_getx/app/modules/home/controllers/maincontroller.dart';
import 'package:todo_with_getx/app/modules/home/controllers/todocontroller.dart';

// import '../controllers/Notes_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<NotesController>(
    //   () => NotesController(),
    // );
    Get.put(NotesController());
    Get.put(TodoController());
    Get.put(MainController());
  }
}
