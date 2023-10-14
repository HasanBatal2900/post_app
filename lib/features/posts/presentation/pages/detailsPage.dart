// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../domain/entities/post.dart';
import 'add_update_post_page.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post's Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  " The Title of Post :\n" + post.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 18),
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  " The Body of the Post :\n" + post.body,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 18),
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
ElevatedButton.icon(
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
    )                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



