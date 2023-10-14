import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/constants.dart/strings.dart';
import '../../../../../core/errors/failures.dart';
import '../../../domain/entities/post.dart';
import '../../../domain/usecases/get_all_post_case.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUseCase getAllPosts;

  PostsBloc({required this.getAllPosts}) : super(PostsInitial()) {
    on<PostsEvent>(
      (event, emit) async {
        if (event is GetAllPostsEvent) {
          emit(LoadingPostState());
          final postsOrFailure = await getAllPosts();

          emit(
            getFailureOrPostState(postsOrFailure),
          );
        } else if (event is RefrechPostsEvent) {
          emit(LoadingPostState());

          final postsOrFailure = await getAllPosts();
          emit(
            getFailureOrPostState(postsOrFailure),
          );
        }
      },
    );
  }
}

PostsState getFailureOrPostState(Either<Failure, List<Post>> either) {
  return either.fold(
      (failure) => ErrorPostState(errorMessage: getMessageError(failure)),
      (posts) => LoadedPostState(posts: posts));
}
