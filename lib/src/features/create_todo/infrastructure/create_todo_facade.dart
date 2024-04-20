import 'package:uuid/uuid.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/src/features/home/domain/entities/todo_model.dart';
import 'package:todoapp/src/features/create_todo/domain/i_create_todo_facade.dart';
// ignore_for_file: prefer_final_fields, no_leading_underscores_for_local_identifiers

class CreateTodoFacade extends ICreateTodoFacade {
  var _todoHiveBox = Hive.box<ToDoModel>('todos');

  @override
  Future<void> createTodo(
      {required String title, required String description}) async {
    ToDoModel _newTodo = ToDoModel(
        id: const Uuid().v4(),
        title: title,
        description: description,
        isDone: false);
    await _todoHiveBox.add(_newTodo);
  }
}
