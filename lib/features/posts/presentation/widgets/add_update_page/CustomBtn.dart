// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    Key? key,
    required this.isUpdateBtn,
    required this.sumbitFun,
  }) : super(key: key);
  final bool isUpdateBtn;
  final Function() sumbitFun;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: sumbitFun,
      icon: isUpdateBtn ? const Icon(Icons.edit) : const Icon(Icons.add),
      label: Padding(
        padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 28),
        child: Text(
          isUpdateBtn ? "Update Post" : "Add Post ",
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
      ),
    );
  }
}
