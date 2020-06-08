import 'dart:convert';

import 'package:todo_app/models/api_response.dart';
import 'package:todo_app/models/todo_for_listing.dart';
import 'package:http/http.dart' as http;

class TodoServices{

  String apiKey = 'https://jsonplaceholder.typicode.com/todos/1';

  Future <ApiResponse<List<TodoForListing>>> getTodoList(){
      return http.get(apiKey).then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        print(jsonData);
        final todos = <TodoForListing>[];
        for (var item in jsonData) {
          final todo = TodoForListing(
            todoID: item['id'],
            todoTitle: item['title'],
            isCompleted:  item['completed']
          );
          todos.add(todo);
        }
        return ApiResponse<List<TodoForListing>>(data: todos);
      }
      return ApiResponse<List<TodoForListing>>(error: true, errorMessage: 'An error occured');
    }).catchError((_)=> ApiResponse<List<TodoForListing>>(error: true, errorMessage: 'An error occured'));
  }
}