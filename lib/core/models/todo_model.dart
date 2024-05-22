

import '../entities/todo_entitiy.dart';

class TodoModel extends TodoEntitiy {
  TodoModel(
      {required super.title,
      required super.description,
      required super.createdAt,
      required super.isDone,
        required super.id});

  factory TodoModel.fromEntity(TodoEntitiy entitiy) {
    return TodoModel(
        title: entitiy.title,
        description: entitiy.description,
        createdAt: entitiy.createdAt,
        isDone: entitiy.isDone, id: entitiy.id);
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        title: json['title'],
        description: json['description'],
        createdAt: json['createdAt'],
        isDone: json['isDone'],
        id: json['id']);
  }

  Map<String, dynamic> toJason() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['createdAt'] = createdAt;
    data['isDone'] = isDone;
    return data;
  }
}
