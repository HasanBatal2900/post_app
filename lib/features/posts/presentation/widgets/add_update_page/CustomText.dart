// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.multiLine,
    required this.title,
  }) : super(key: key);
  final TextEditingController controller;
  final bool multiLine;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "The $title should' not be Empty";
        }
        return null;
      },

      maxLines: multiLine ? 6:1,
      controller: controller,
      minLines: multiLine? 6:1,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(16, 24, 12, 16),
        hintText: "Enter The $title",
        filled: true,
        labelText: title,
        fillColor: Colors.grey.shade300,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
      autocorrect: true,
      cursorColor: Theme.of(context).colorScheme.primary,
    );
  }
}
