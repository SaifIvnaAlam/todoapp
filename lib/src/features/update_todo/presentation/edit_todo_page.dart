import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/src/core/utils/app_strings.dart';
import 'package:todoapp/src/core/utils/bounce_effect.dart';
import '../../home/application/Todo_cubit/todo_cubit.dart';
import 'package:todoapp/src/core/presentation/style/text_style.dart';
import 'package:todoapp/src/core/presentation/style/app_spacing.dart';
import 'package:todoapp/src/core/presentation/componenets/show_error.dart';
import 'package:todoapp/src/features/home/domain/entities/todo_model.dart';
import 'package:todoapp/src/features/update_todo/application/update_todo_cubit/update_todo_cubit.dart';

// ignore_for_file: no_leading_underscores_for_local_identifiers

class EditTodoPage extends StatelessWidget {
  const EditTodoPage({super.key, required this.todo});
  final ToDoModel todo;

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController =
        TextEditingController(text: todo.title);
    TextEditingController _descriptionController =
        TextEditingController(text: todo.description);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Todo"),
        actions: [
          Bounce(
            onTap: () {
              _titleController.text.isEmpty
                  ? showSnackbar(
                      context: context,
                      message: "Opps! Your forgot to add title")
                  : context
                      .read<UpdateTodoCubit>()
                      .updateTodo(
                          id: todo.id,
                          description: _descriptionController.text,
                          title: _titleController.text)
                      .then(
                      (value) {
                        context.read<TodoCubit>().getTodos();
                        Navigator.pop(context);
                      },
                    );
            },
            child: const Text(
              "Done",
              style: textBtnStyle,
            ),
          ),
          horizontalSpacing8,
          Bounce(
            onTap: () {
              context
                  .read<UpdateTodoCubit>()
                  .deleteTodo(id: todo.id)
                  .then((value) {
                context.read<TodoCubit>().getTodos();
                Navigator.pop(context);
                showSnackbar(context: context, message: deletedTaskText);
              });
            },
            child: Text("Delete",
                style: textBtnStyle.copyWith(color: Colors.redAccent)),
          ),
          horizontalSpacing8,
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
                    fillColor: Color.fromARGB(255, 226, 223, 223),
                    filled: true,
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
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
      ),
    );
  }
}
