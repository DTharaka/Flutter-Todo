import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/services/todo_service.dart';
import 'views/todo_list.dart';

void setUpLocator(){
  GetIt.instance.registerLazySingleton(() => TodoServices());
}

void main() {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoList(),
    );
  }
}