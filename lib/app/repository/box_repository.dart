import 'package:hive/hive.dart';
import 'package:todo_with_getx/app/data/moduls/todo_modul.dart';

class Boxrepository{
        static openBox() async => await Hive.openBox("Notesbox");

        static Box getBox()=> Hive.box<NotesModel>("Notesbox");

        static claseBox() async=>await Hive.box<NotesModel>("Notesbox").close();
}