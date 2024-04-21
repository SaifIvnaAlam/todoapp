abstract class IUpdateTodoFacade {
  Future<void> updateTodo(
      {required String id, required String title, required String description});
  Future<void> deleteTodo({required String id});
}
