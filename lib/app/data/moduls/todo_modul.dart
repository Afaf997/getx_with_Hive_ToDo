import 'package:hive/hive.dart';

part 'todo_modul.g.dart';


  @HiveType(typeId:1)
class NotesModel extends HiveObject{
  @HiveField(0)
  String title;
  NotesModel({required this.title,});
  
}

  
@HiveType(typeId:2)
class TodoModel extends HiveObject{
  @HiveField(0)
  String title;
  @HiveField(1)
  String desctription;

  TodoModel({required this.title,required this.desctription,});
}

