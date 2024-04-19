import 'package:flutter/material.dart';
import 'package:todoapp/src/features/home/domain/demo_data.dart';
import 'package:todoapp/src/features/create_todo/presentation/create_todo_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Todos"),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CreateTodoPage()),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: demoData.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(demoData[index].title),
              ),
            );
          },
        ),
      ),
    );
  }
}
