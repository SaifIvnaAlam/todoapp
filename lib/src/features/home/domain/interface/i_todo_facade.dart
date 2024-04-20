import 'package:todoapp/src/features/home/domain/entities/todo_model.dart';

abstract class ITodoFacade {
  Future<List<ToDoModel>> getTodos();
  Future<bool> completedTodo({required String id});
}
