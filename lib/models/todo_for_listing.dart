class TodoForListing {
  String todoID;
  String todoTitle;
  bool isCompleted;

  TodoForListing({this.todoID, this.todoTitle, this.isCompleted});

  factory TodoForListing.fromJson(Map<String, dynamic> item) {
    return TodoForListing(
        todoID: item['id'],
        todoTitle: item['title'],
        isCompleted: item['completed']);
  }
}
