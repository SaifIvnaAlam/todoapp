import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/src/core/utils/hive_box_names.dart';
import 'package:todoapp/src/features/home/domain/entities/todo_model.dart';
import 'package:todoapp/src/features/update_todo/domain/interface/i_update_todo_facade.dart';

class UpdateTodoFacade implements IUpdateTodoFacade {
  final _todoHiveBox = Hive.box<ToDoModel>(todoBox);

  @override
  Future<void> updateTodo(
      {required String id,
      required String title,
      required String description}) async {
    for (int i = 0; i < _todoHiveBox.length; i++) {
      ToDoModel? currentItem = _todoHiveBox.getAt(i);

      if (currentItem!.id == id) {
        currentItem.title = title;
        currentItem.description = description;

        _todoHiveBox.putAt(i, currentItem);
      }
    }
  }

  @override
  Future<void> deleteTodo({required String id}) async {
    final index = _todoHiveBox.values.toList().indexWhere((t) => t.id == id);
    if (index != -1) {
      await _todoHiveBox.deleteAt(index);
    }
  }
}
