import 'package:flutter/material.dart';

void buildSnakBar(Color color, String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color,
      padding: const EdgeInsets.all(10.0),
      duration: const Duration(milliseconds: 1800),
      dismissDirection: DismissDirection.horizontal,
    ),
  );
}
