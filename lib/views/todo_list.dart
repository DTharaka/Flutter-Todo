import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/models/api_response.dart';
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

  ApiResponse<List<TodoForListing>> _apiResponse;
  bool _isLoading = false;

  @override
  void initState() {
    _fetchTodos();
    super.initState();
  }

  void _fetchTodos() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getTodoList();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('List of Todos')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => TodoModify()));
          },
          child: Icon(Icons.add),
        ),
        body: Builder(builder: (_) {
          if (_isLoading) {
            return CircularProgressIndicator();
          }

          if (_apiResponse.error) {
            return Center(child: Text(_apiResponse.errorMessage));
          }

          return ListView.separated(
            separatorBuilder: (_, __) =>
                Divider(height: 1, color: Colors.green),
            itemBuilder: (_, index) {
              return Dismissible(
                key: ValueKey(_apiResponse.data[index].todoID),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {},
                confirmDismiss: (direction) async {
                  final result = await showDialog(
                      context: context, builder: (_) => TodoDelete());
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
                    )),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => TodoModify(
                            todoID: _apiResponse.data[index].todoID)));
                  },
                  title: Text(_apiResponse.data[index].todoTitle,
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                  subtitle: Text('Last edited on today'),
                ),
              );
            },
            itemCount: _apiResponse.data.length,
          );
        }));
  }
}
