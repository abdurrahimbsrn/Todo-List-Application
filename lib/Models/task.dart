import 'package:flutter/cupertino.dart';
import 'package:gorevler/constants/taskFlame.dart';

class Task {
  Task({
    required this.id,
    required this.title,
    required this.detail,
    required this.category,
    required this.flame,
    required this.completeDate,
    required this.creationDate,
  });

  final int id;
  final String title;
  final String detail;
  final String category;
  final TaskFlame flame;
  final DateTime? completeDate;
  final DateTime creationDate;
}

class TaskCategory {
  TaskCategory({
    required this.categoryName,
  });
  final String categoryName;
}