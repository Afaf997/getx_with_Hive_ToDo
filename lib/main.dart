import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_with_getx/app/data/moduls/todo_modul.dart';

import 'app/routes/app_pages.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  Directory directory =await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>("NotesBox");
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>("todobox");  
  runApp(
    GetMaterialApp(
      title: "todo app with getx",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
