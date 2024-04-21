import 'package:flutter/material.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({
    super.key,
    required TextEditingController titleController,
  }) : _titleController = titleController;

  final TextEditingController _titleController;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 1.3,
            ),
          ),
        ),
      ),
    );
  }
}
