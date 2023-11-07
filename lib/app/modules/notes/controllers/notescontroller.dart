import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo_with_getx/app/data/moduls/todo_modul.dart';

class NotesController extends GetxController {
  final Box<NotesModel> _todomodelList = Hive.box("NotesBox");
    RxList<NotesModel> notesBox = <NotesModel>[].obs; 



  void onInit() {
    super.onInit();
    notesBox.assignAll(_todomodelList.values.toList());
  }

  void addNotesList(String title,) {
    final newTodoList = NotesModel(title: title, );
    _todomodelList.add(newTodoList);
        notesBox.add(newTodoList); 
  }

  void updateNotesList(NotesModel todo, String title) {
    todo.title = title;
    todo.save();

  }


  void deleteTodo(NotesModel tododelete) {
      tododelete.delete();
      notesBox.remove(tododelete); 
  }
}






