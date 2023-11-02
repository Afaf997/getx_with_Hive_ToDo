import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo_with_getx/app/repository/box_repository.dart';

class NotesController extends GetxController {

  final Box _observablebox =Boxrepository.getBox();

   Box get observablebox => _observablebox;
   int get notescount => _observablebox.length;

  final count = 0.obs;
  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
