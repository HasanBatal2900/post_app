// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_app/features/posts/presentation/pages/postPage.dart';

import '../../bloc/post_operations/post_opreations_bloc.dart';

class DeleteBtn extends StatelessWidget {
  const DeleteBtn({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  buildAlretDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return AlertDialog(
            backgroundColor: Colors.white,
            content: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Text("Are You Sure"),
            ),
            actions: [
              TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
                label: const Text("Cancel"),
              ),
              TextButton.icon(
                onPressed: () {
                  BlocProvider.of<PostOpreationsBloc>(context).add(
                    DeletePostEvent(postId: id),
                  );

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostPage(),
                      ));
                },
                style: TextButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.onSecondaryContainer,
                    textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onErrorContainer,
                    )),
                icon: const Icon(Icons.done),
                label: const Text("Delete"),
              ),
            ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 170,
      onPressed: () {
        buildAlretDialog(context);
      },
      child: Text(
        "Delete ",
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Theme.of(context).colorScheme.error),
      ),
      color: Theme.of(context).colorScheme.errorContainer,
    );
  }
}
