import 'dart:convert';

import 'package:todo_app/models/api_response.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/models/todo_for_listing.dart';
import 'package:http/http.dart' as http;

class TodoServices{

  static const apiKey = 'https://jsonplaceholder.typicode.com';

  Future <ApiResponse<List<TodoForListing>>> getTodoList(){
      return http.get(apiKey + '/todos').then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        print(jsonData);
        final todos = <TodoForListing>[];
        for (var item in jsonData) {
          todos.add(TodoForListing.fromJson(item));
        }
        return ApiResponse<List<TodoForListing>>(data: todos);
      }
      return ApiResponse<List<TodoForListing>>(error: true, errorMessage: 'An error occured');
    }).catchError((_)=> ApiResponse<List<TodoForListing>>(error: true, errorMessage: 'An error occured'));
  }

    Future <ApiResponse<Todo>> getTodo(String todoID){
      return http.get(apiKey + '/todos/' + todoID).then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        return ApiResponse<Todo>(data: Todo.fromJson(jsonData));
      }
      return ApiResponse<Todo>(error: true, errorMessage: 'An error occured');
    }).catchError((_)=> ApiResponse<Todo>(error: true, errorMessage: 'An error occured'));
  }
}

