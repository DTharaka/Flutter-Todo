import 'package:flutter/material.dart';

class TodoDelete extends StatelessWidget {
  const TodoDelete({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning!!!'),
      content: Text('Are you sure to delete this todo?'),
      actions: <Widget>[
        FlatButton(
          onPressed: (){
            Navigator.of(context).pop(true);
          }, 
          child: Text('Yes')
        ),
        FlatButton(
          onPressed: (){
            Navigator.of(context).pop(false);
          }, 
          child: Text('No')
        )
      ],
    );
  }
}