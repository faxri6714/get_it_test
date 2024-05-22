import 'package:flutter/cupertino.dart';

class TodoEntitiy {
  final String id;
  final String title;
  final String description;
  final DateTime createdAt;
  bool isDone;

  TodoEntitiy(
      {required this.id,
      required this.title,
      required this.description,
      required this.createdAt,
      required this.isDone});

  factory TodoEntitiy.empty() {
    return TodoEntitiy(
        title: "",
        description: "",
        createdAt: DateTime.now(),
        isDone: false,
        id: DateTime.now().microsecondsSinceEpoch.toString());
  }

  TodoEntitiy copyWith(
      {String? id,
      String? title,
      String? description,
      DateTime? createdAt,
      bool? isDone}) {
    return TodoEntitiy(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  String toString() {
    return """
    id : $id
    title : $title
    description : $description
    createdAt : $createdAt
    isDone : $isDone
    """;
  }
}
