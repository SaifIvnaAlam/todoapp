import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/src/core/utils/app_strings.dart';
import '../../home/application/Todo_cubit/todo_cubit.dart';
import 'package:todoapp/src/core/presentation/style/text_style.dart';
import 'package:todoapp/src/core/presentation/componenets/show_error.dart';
import 'package:todoapp/src/features/create_todo/presentation/components/body_text_field.dart';
import 'package:todoapp/src/features/create_todo/presentation/components/title_text_field.dart';
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
                  ? showSnackbar(
                      context: context, message: forgotTitleErrorText)
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
                Text(
                  "Create",
                  style: textBtnStyle,
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              child: Text(
                DateFormat('d MMMM y').format(DateTime.now()),
              ),
            ),
            TitleTextField(titleController: _titleController),
            BodyTextfield(descriptionController: _descriptionController),
          ],
        ),
      ),
    );
  }
}
