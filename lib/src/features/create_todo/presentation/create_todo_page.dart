import 'package:flutter/material.dart';
import 'package:todoapp/src/core/presentation/componenets/show_error.dart';
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
                      context: context, message: "Title Can not be empty")
                  : print(_titleController.text);
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
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            child: Text("Date time"
                // DateFormat('d MMMM y').format(DateTime.now().toString()),
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
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  counterText: "",
                  fillColor: Colors.grey,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: TextStyle(
                      fontSize: 39,
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
              fontSize: 30,
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
                fontSize: 30,
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
