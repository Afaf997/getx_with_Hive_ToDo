 import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo_with_getx/app/data/moduls/todo_modul.dart';

class TodoController extends GetxController {
  final Box<TodoModel> _todomodelList = Hive.box("todosBox");
  RxList<TodoModel> todosBox = <TodoModel>[].obs; 
  TodoModel? editingTodo;

  @override
  void onInit() {
    super.onInit();
    todosBox.assignAll(_todomodelList.values.toList());
  }

  void addTodoList(String title, String description) {
    final newTodoList = TodoModel(title: title, desctription: description);
    _todomodelList.add(newTodoList);
    todosBox.add(newTodoList); 
  }

  void updateTodoList(TodoModel todo, String title, String description) {
    todo.title = title;
    todo.desctription =description;
    todo.save();
  
  }

  void deleteTodo(TodoModel tododelete) {
    tododelete.delete();
  }
}
