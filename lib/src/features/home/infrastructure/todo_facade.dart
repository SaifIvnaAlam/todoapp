import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/src/features/home/domain/entities/todo_model.dart';
import 'package:todoapp/src/features/home/domain/interface/i_todo_facade.dart';

class TodoFacade implements ITodoFacade {
  final _todoHiveBox = Hive.box<ToDoModel>('todos');

  @override
  Future<List<ToDoModel>> getTodos() async {
    return _todoHiveBox.values.toList();
  }

  @override
  Future<bool> completedTodo({required String id}) async {
    for (int i = 0; i < _todoHiveBox.length; i++) {
      ToDoModel? currentItem = _todoHiveBox.getAt(i);

      if (currentItem!.id == id) {
        currentItem.isDone = !currentItem.isDone;

        _todoHiveBox.putAt(i, currentItem);
        return true;
      }
    }
    return false;
  }
}
