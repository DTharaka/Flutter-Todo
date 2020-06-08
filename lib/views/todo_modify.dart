import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/services/todo_service.dart';

class TodoModify extends StatefulWidget {

  final String todoID;
  TodoModify({this.todoID});

  @override
  _TodoModifyState createState() => _TodoModifyState();
}

class _TodoModifyState extends State<TodoModify> {
  bool get isEditing => widget.todoID != null;

  TodoServices get todosService => GetIt.I<TodoServices>();

  @override
  void initState() {
    todosService.getTodo(widget.todoID)
    .then((data) {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( isEditing ? 'Update Todo' : 'Create Todo')
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Todo Name',
              ),
            ),
            Container(height: 8.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Add note',
              )
            ),
            Container(height: 16.0),
            SizedBox(
              width: double.infinity,
              height: 35.0,
              child: RaisedButton(
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: (){
                if(isEditing){
                  // Update todo in API
                }else{
                  // Create todo in API
                }
                Navigator.of(context).pop();
              },
              )
            ),
          ],
        ),
      )
    );
  }
}