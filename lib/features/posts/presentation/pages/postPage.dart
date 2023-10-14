import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/posts/posts_bloc.dart';
import '../widgets/loading_widget.dart';
import '../widgets/post_page/ErrorMessageWidget.dart';
import '../widgets/post_page/postListWidget.dart';
import 'add_update_post_page.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostsBloc>(context).add(
      GetAllPostsEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget buildFloatActionButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return const AddUpdatePostPage(isUpdate: false);
              },
              transitionDuration: const Duration(milliseconds: 600),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                animation = CurvedAnimation(
                    parent: animation, curve: Curves.fastOutSlowIn);
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, 0),
                    end: const Offset(0, 0),
                  ).animate(animation),
                  child: child,
                );
              },
            ),
          );
        },
        backgroundColor: const Color(0xFF082659),
        child: const Icon(Icons.add),
      );
    }

    return Scaffold(
      floatingActionButton: buildFloatActionButton(),
      appBar: AppBar(
        title: const Text(
          "Posts Page",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: buildBody(),
    );
  }
}

Widget buildBody() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
    child: BlocBuilder<PostsBloc, PostsState>(
      builder: (context, state) {
        log("$state");
        if (state is LoadedPostState) {
          final posts = state.posts;
          return RefreshIndicator(
              onRefresh: () => _onRefresh(context),
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              child: PostList(
                posts: posts,
              ));
        } else if (state is ErrorPostState) {
          return ErrorMessage(message: state.errorMessage);
        }
        return const LoadingWidget();
      },
    ),
  );
}

_onRefresh(BuildContext context) {
  BlocProvider.of<PostsBloc>(context).add(RefrechPostsEvent());
}
