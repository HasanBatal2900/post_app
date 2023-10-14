import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme.dart';
import 'features/posts/presentation/bloc/post_operations/post_opreations_bloc.dart';
import 'features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'features/posts/presentation/pages/postPage.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostsBloc>(
          create: (_) => di.sl<PostsBloc>(),
        ),
        BlocProvider<PostOpreationsBloc>(
          create: (_) => di.sl<PostOpreationsBloc>(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false, theme: appTheme, home: PostPage()),
    );
  }
}
