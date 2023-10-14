import 'package:flutter/material.dart';

import '../../../domain/entities/post.dart';
import 'postTile.dart';

class PostList extends StatelessWidget {
  const PostList({super.key, required this.posts});
  final List<Post> posts;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return PostTile(post: posts[index]);
      },
      itemCount: posts.length,
      separatorBuilder: (context, index) => const Divider(
        color: Colors.black,
        thickness: 2,
      ),
    );
  }
}
