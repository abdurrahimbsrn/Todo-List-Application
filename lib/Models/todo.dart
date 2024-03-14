class Todo {
  int? id;
  String title;
  String detail;
  String category;
  DateTime? date;
  DateTime creationDate;

  Todo(this.title, this.detail, this.category, {this.date, DateTime? creationDate})
      : this.creationDate = creationDate ?? DateTime.now();

  Todo.withId(this.id, this.title, this.detail, this.category, {this.date, DateTime? creationDate})
      : this.creationDate = creationDate ?? DateTime.now();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "title": title,
      "detail": detail,   
      "category": category,
      "creationDate": creationDate.toIso8601String(),
    };
    if (id != null) {
      map["id"] = id!;
    }
    if (date != null) {
      map["date"] = date!.toIso8601String();
    }
    return map;
  }
}
