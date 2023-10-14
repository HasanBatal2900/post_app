import 'package:flutter/material.dart';

import '../../../domain/entities/post.dart';
import '../../pages/detailsPage.dart';

class PostTile extends StatelessWidget {
  const PostTile({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return DetailsPage(
                post: post,
              );
            },
            barrierColor: Theme.of(context).colorScheme.primary,
            transitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.fastOutSlowIn);
              return ScaleTransition(
                alignment: Alignment.center,
                scale: animation,
                child: child,
              );
            },
          ),
        );
      },
      leading: Padding(
        padding: const EdgeInsets.only(right: 4.0),
        child: Container(
          child: Text(
            "${post.id}",
            style: TextStyle(color: Colors.white),
          ),
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary.withOpacity(0.7),
              ],
            ),
          ),
        ),
      ),
      title: Text(
        post.title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Container(
        margin:const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
        child: Text(
          post.body,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
