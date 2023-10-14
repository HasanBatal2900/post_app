// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'posts_bloc.dart';

sealed class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

final class PostsInitial extends PostsState {}

class LoadingPostState extends PostsState {}

class LoadedPostState extends PostsState {
  const LoadedPostState({
    required this.posts,
  });
  final List<Post> posts;
  @override
  List<Object> get props => [posts];
}

class ErrorPostState extends PostsState {
  final String errorMessage;
 const ErrorPostState({
    required this.errorMessage,
  });
  
  @override
  List<Object> get props => [errorMessage];


}
