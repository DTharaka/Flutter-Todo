import 'package:todo_app/models/todo_for_listing.dart';

class TodoServices{
  List<TodoForListing> getTodoList(){
    return [
    new TodoForListing(
      todoID: '1',
      todoTitle: 'Todo 1', 
      createDateTime: DateTime.now(),
      lastEditedDateTime: DateTime.now()
    ),
    new TodoForListing(
      todoID: '2',
      todoTitle: 'Todo 2', 
      createDateTime: DateTime.now(),
      lastEditedDateTime: DateTime.now()
    ),
    new TodoForListing(
      todoID: '3',
      todoTitle: 'Todo 3', 
      createDateTime: DateTime.now(),
      lastEditedDateTime: DateTime.now()
    )
  ];
  }

}