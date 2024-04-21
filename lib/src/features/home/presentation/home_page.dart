import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/src/features/home/application/Todo_cubit/todo_cubit.dart';
import 'package:todoapp/src/features/home/presentation/components/todo_list.dart';
import 'package:todoapp/src/features/create_todo/presentation/create_todo_page.dart';

//Home page of the application
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<TodoCubit>().getTodos();
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
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
          bottom: const TabBar(
            // Tabs for not completed and completed todos
            tabs: [
              Tab(text: 'Not Completed'),
              Tab(text: 'Completed'),
            ],
          ),
        ),
        body: BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {
            return state.when(
              error: () => const Text("error"),
              loading: () => const CircularProgressIndicator.adaptive(),
              loaded: (data) {
                return TabBarView(
                  // Corresponding views for each tab
                  children: [
                    buildTodoList(
                        context, data.where((todo) => !todo.isDone).toList()),
                    buildTodoList(
                        context, data.where((todo) => todo.isDone).toList()),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
