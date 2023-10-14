import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/snakBars.dart';
import '../../domain/entities/post.dart';
import '../bloc/post_operations/post_opreations_bloc.dart';
import '../widgets/add_update_page/FormWidget.dart';
import '../widgets/loading_widget.dart';

class AddUpdatePostPage extends StatelessWidget {
  const AddUpdatePostPage({super.key, required this.isUpdate, this.post});
  final Post? post;
  final bool isUpdate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isUpdate ? const Text("Edit Post") : const Text("Add Post"),
      ),
      body: BlocConsumer<PostOpreationsBloc, PostOpreationsState>(
        builder: (context, state) {
          if (state is LoadingAddorDeleteorUpdateState) {
            return const LoadingWidget();
          }
          return  FormWidget(
            isUpdate: isUpdate,
            post: isUpdate? post:null,
          );
        },
        listener: (context, state) {
          if (state is MessageAddorDeleteorUpdateState) {
            buildSnakBar(Colors.green, state.message, context);
            Navigator.pop(context);
          } else if (state is ErrorAddorDeleteorUpdateState) {
            buildSnakBar(Colors.red, state.errorMessage, context);
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
