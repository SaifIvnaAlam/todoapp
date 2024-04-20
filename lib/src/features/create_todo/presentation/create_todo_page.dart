import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../home/application/Todo_cubit/todo_cubit.dart';
import 'package:todoapp/src/core/presentation/componenets/show_error.dart';
import 'package:todoapp/src/features/create_todo/application/create_todo_cubit/createtodo_cubit.dart';

// ignore_for_file: no_leading_underscores_for_local_identifiers

class CreateTodoPage extends StatelessWidget {
  const CreateTodoPage({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = TextEditingController();
    TextEditingController _descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Todo"),
        actions: [
          MaterialButton(
            onPressed: () {
              _titleController.text.isEmpty
                  ? showError(
                      context: context, message: "Title can not be empty")
                  : context
                      .read<CreatetodoCubit>()
                      .createTodo(
                          description: _descriptionController.text,
                          title: _titleController.text)
                      .then(
                      (value) {
                        context.read<TodoCubit>().getTodos();

                        Navigator.pop(context);
                      },
                    );
            },
            child: const Row(
              children: [
                Icon(Icons.add),
                Text("Create"),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            child: Text(
              DateFormat('d MMMM y').format(
                DateTime.now(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: TextFormField(
                controller: _titleController,
                maxLength: 10000,
                maxLines: null,
                onTapOutside: (pointerDownEvent) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  counterText: "",
                  fillColor: Color.fromARGB(255, 201, 199, 199),
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ),
          TextFormField(
            controller: _descriptionController,
            maxLength: 10000,
            maxLines: null,
            onTapOutside: (pointerDownEvent) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            keyboardType: TextInputType.multiline,
            style: const TextStyle(
              fontSize: 20,
              height: 2,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            minLines: 4,
            scrollPhysics: const NeverScrollableScrollPhysics(),
            decoration: const InputDecoration(
              border: InputBorder.none,
              counterText: "",
              hintText: '   Description',
              hintStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
