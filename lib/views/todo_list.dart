import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/models/todo_for_listing.dart';
import 'package:todo_app/services/todo_service.dart';
import 'package:todo_app/views/todo_delete.dart';
import 'package:todo_app/views/todo_modify.dart';

class TodoList extends StatefulWidget {

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  TodoServices get service => GetIt.instance<TodoServices>();
  List<TodoForListing> todos = [];

  String formatDateTime(DateTime dateTime){
    return '${dateTime.year}/${dateTime.month}/${dateTime.day}';
  }

  @override
  void initState() {
    todos = service.getTodoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Todos')
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>TodoModify()));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green),
        itemBuilder: (_, index){
          return Dismissible(
              key: ValueKey(todos[index].todoID),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction){

              },
              confirmDismiss: (direction) async{
                final result = await showDialog(
                  context: context,
                  builder: (_) => TodoDelete()
                );
                print(result);
                return result;
              },
              background: Container(
                color: Colors.red,
                padding: EdgeInsets.only(left: 15),
                child: Align(
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  alignment: Alignment.centerLeft,
                )
              ),
              child: ListTile(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>TodoModify(todoID: todos[index].todoID)));
              },
              title: Text(
                todos[index].todoTitle,
                style: TextStyle(color: Theme.of(context).primaryColor)
              ),
              subtitle: Text('Last edited on ${formatDateTime(todos[index].lastEditedDateTime)}'),
            ),
          );
        },
        itemCount: todos.length,
      ),
    );
  }
}