 import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo_with_getx/app/data/moduls/todo_modul.dart';

class TodoController extends GetxController {
  final Box<TodoModel> _todomodelList = Hive.box("todosBox");
  RxList<TodoModel> todosBox = <TodoModel>[].obs; // RxList for GetX
  TodoModel? editingTodo;

  @override
  void onInit() {
    super.onInit();
    todosBox.assignAll(_todomodelList.values.toList());
  }

  void addTodoList(String title, String description) {
    final newTodoList = TodoModel(title: title, desctription: description);
    _todomodelList.add(newTodoList);
    todosBox.add(newTodoList); // Add to the observable list
  }

  void updateTodoList(TodoModel todo, String title, String description) {
    todo.title = title;
    todo.desctription =description;
    todo.save();
  
  }

  // void startEditing(TodoModel todo) {
  //   editingTodo = todo;
  // }

  // void cancelEditing() {
  //   editingTodo = null;
  // }

  void deleteTodo(TodoModel tododelete) {
    tododelete.delete();
    todosBox.remove(tododelete); // Remove from the observable list
  }

  //  void todoChecked(TodoModel todo) {
  //   todo.ischecked = !todo.ischecked;
  //   todo.save();
  // }
}
