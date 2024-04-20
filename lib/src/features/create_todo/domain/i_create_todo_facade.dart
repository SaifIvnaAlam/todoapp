abstract class ICreateTodoFacade {
  Future<void> createTodo({required String title, required String description});
}
