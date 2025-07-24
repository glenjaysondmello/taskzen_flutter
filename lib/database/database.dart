import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];

  final _myBox = Hive.box("mybox");
  final String userId;

  TodoDatabase({required this.userId});

  String get userKey => "TODO_$userId";

  void createInitialData() {
    todoList = [
      ["Task 1", false],
      ["Task 2", false],
    ];
  }

  void loadData() {
    todoList = _myBox.get(userKey, defaultValue: []) ?? [];
  }

  void updateData() {
    _myBox.put(userKey, todoList);
  }
}
