import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/src/core/utils/app_strings.dart';
import 'package:todoapp/src/core/utils/bounce_effect.dart';
import 'package:todoapp/src/core/presentation/componenets/show_error.dart';
import 'package:todoapp/src/features/home/domain/entities/todo_model.dart';
import 'package:todoapp/src/features/home/application/Todo_cubit/todo_cubit.dart';
import 'package:todoapp/src/features/update_todo/presentation/edit_todo_page.dart';

Widget buildTodoList(BuildContext context, List<ToDoModel> todos) {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: todos.isNotEmpty
          ? ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 8,
                  ),
                  child: Bounce(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditTodoPage(todo: todo),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: todo.isDone
                            ? Colors.red.shade100
                            : Colors.orange.shade100.withOpacity(1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 7),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          trailing: Checkbox(
                            value: todo.isDone,
                            onChanged: (value) {
                              context
                                  .read<TodoCubit>()
                                  .completeTodo(id: todo.id);
                              context.read<TodoCubit>().getTodos();
                              showSnackbar(
                                  context: context,
                                  message: !todo.isDone
                                      ? updoCompletedTaskText
                                      : completedTaskText);
                            },
                          ),
                          title: Text(
                            todo.title,
                            style: TextStyle(
                                decoration: todo.isDone
                                    ? TextDecoration.lineThrough
                                    : null),
                          ),
                          subtitle:
                              Text(todo.createdAt ?? "No Create Date Found"),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text(emptyTodoListText),
            ));
}
