class Task {
  int? id;
  String title;

  Task.fromData(this.id, this.title);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }
}
