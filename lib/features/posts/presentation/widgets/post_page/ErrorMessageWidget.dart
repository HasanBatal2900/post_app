import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key, required this.message});

  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        alignment: Alignment.center,
        color: Colors.red,
        padding:const EdgeInsets.all(15.0),
        height: MediaQuery.of(context).size.height / 4,
        child: SingleChildScrollView(
          child: Text(
            message,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
