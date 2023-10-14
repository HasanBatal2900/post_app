import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/constants.dart/strings.dart';
import '../../../../../core/errors/failures.dart';
import '../../../domain/entities/post.dart';
import '../../../domain/usecases/add_post_usecase.dart';
import '../../../domain/usecases/delete_post_usecase.dart';
import '../../../domain/usecases/update_post_usecase.dart';

part 'post_opreations_event.dart';
part 'post_opreations_state.dart';

class PostOpreationsBloc
    extends Bloc<PostOpreationsEvent, PostOpreationsState> {
  final AddPostUseCase addPost;
  final UpdatePostUseCase updatePost;
  final DeletePostUseCase deletePost;
  PostOpreationsBloc(
      {required this.addPost,
      required this.deletePost,
      required this.updatePost})
      : super(PostOpreationsInitial()) {
    on<PostOpreationsEvent>((event, emit) async {
      if (event is AddPostEvent) {
        emit(
          LoadingAddorDeleteorUpdateState(),
        );

        final failureOrPosts = await addPost(event.post);
        emit(getFailuteOrAddOrDeleteOrUpdateState(
            failureOrPosts, successAddPostMessage));
      } else if (event is DeletePostEvent) {
        emit(
          LoadingAddorDeleteorUpdateState(),
        );

        final failureOrPosts = await deletePost(event.postId);

        emit(getFailuteOrAddOrDeleteOrUpdateState(
            failureOrPosts, successDeletePostMessage));
      } else if (event is UpdatePostEvent) {
        final failureOrPosts = await updatePost(event.post);
        emit(getFailuteOrAddOrDeleteOrUpdateState(
            failureOrPosts, successUpatePostMessage));
      }
    });
  }
}

PostOpreationsState getFailuteOrAddOrDeleteOrUpdateState(
    Either<Failure, Unit> either, String doneMessage) {
  return either.fold((failure) {
    return ErrorAddorDeleteorUpdateState(
      errorMessage: getMessageError(failure),
    );
  }, (_) {
    return MessageAddorDeleteorUpdateState(message: doneMessage);
  });
}
