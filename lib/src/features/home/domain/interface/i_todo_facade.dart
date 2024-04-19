abstract class ITodoFacade {
  Future<void> createTodo();
  Future<void> completedTodo();
  Future<void> deleteTodo();
  Future<void> updateTodo();
}
