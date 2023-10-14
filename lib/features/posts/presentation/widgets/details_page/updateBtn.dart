// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../domain/entities/post.dart';
import '../../pages/add_update_post_page.dart';

class EditBtn extends StatelessWidget {
  const EditBtn({
    Key? key,
    required this.post,

  }) : super(key: key);
  final Post post;
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return AddUpdatePostPage(
                isUpdate: true,
                post: post,
              );
            },
            barrierColor: Theme.of(context).colorScheme.primary,
            transitionDuration: const Duration(milliseconds: 1600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.fastOutSlowIn);
              return SlideTransition(
                position:
                    Tween(begin: const Offset(0, -1), end: const Offset(0, 0))
                        .animate(animation),
                child: child,
              );
            },
          ),
        );
      },
      icon: const Icon(Icons.edit),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
        child: Text("Edit"),
      ),
    );
  }
}
