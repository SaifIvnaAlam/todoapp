import 'package:flutter/material.dart';

class BodyTextfield extends StatelessWidget {
  const BodyTextfield({
    super.key,
    required TextEditingController descriptionController,
  }) : _descriptionController = descriptionController;

  final TextEditingController _descriptionController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
