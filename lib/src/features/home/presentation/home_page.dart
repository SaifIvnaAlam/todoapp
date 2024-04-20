import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/src/features/home/application/Todo_cubit/todo_cubit.dart';
import 'package:todoapp/src/features/create_todo/presentation/create_todo_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TodoCubit>().getTodos();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Todos"),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateTodoPage(),
                ),
              );
            },
            child: const Row(
              children: [
                Icon(Icons.add),
                Text("Add"),
              ],
            ),
          ),
        ],
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          return state.when(
            error: () => const Text("error"),
            loading: () => const CircularProgressIndicator.adaptive(),
            loaded: (data) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final todo = data[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 8,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: todo.isDone
                            ? Colors.red.shade100
                            : Colors.cyan.shade100,
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
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: ListTile(
                          trailing: Checkbox(
                            value: todo.isDone,
                            onChanged: (value) {
                              context
                                  .read<TodoCubit>()
                                  .completeTodo(id: todo.id);
                              context.read<TodoCubit>().getTodos();
                            },
                          ),
                          title: Text(
                            todo.title,
                            style: TextStyle(
                              decoration: todo.isDone
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
