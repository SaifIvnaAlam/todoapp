import 'dart:developer';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/src/features/home/domain/entities/todo_model.dart';
import 'package:todoapp/src/features/update_todo/infrastructure/update_todo_facade.dart';

class MockHiveBox extends Mock implements Box<ToDoModel> {}

void main() {
  late UpdateTodoFacade updateTodoFacade;
  late MockHiveBox mockHiveBox;

  setUp(() {
    mockHiveBox = MockHiveBox();
    updateTodoFacade = UpdateTodoFacade();
  });

  group('UpdateTodoFacade', () {
    test('deleteTodo deletes a todo from the Hive box', () async {
      // Arrange
      const todoId = 'test_id';
      final todoToRemove = ToDoModel(
          id: todoId,
          title: 'Test Title',
          description: 'Test Description',
          isDone: false);

      // Mock behavior to return the todoToRemove when its id is requested
      when(mockHiveBox.get(todoId)).thenReturn(todoToRemove);

      // Act
      await updateTodoFacade.deleteTodo(id: todoId);

      // Assert
      verify(mockHiveBox.delete(todoId)).called(1);
      log("Test passed");
    });
  });
}
