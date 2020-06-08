class Todo {
  String todoID;
  String todoTitle;
  bool isCompleted;

  Todo({this.todoID, this.todoTitle, this.isCompleted});

  factory Todo.fromJson(Map<String, dynamic> item) {
    return Todo(
        todoID: item['id'],
        todoTitle: item['title'],
        isCompleted: item['completed']);
  }
}
