// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'post_opreations_bloc.dart';

sealed class PostOpreationsEvent extends Equatable {
  const PostOpreationsEvent();

  @override
  List<Object> get props => [];
}

class AddPostEvent extends PostOpreationsEvent {
  final Post post;
  const AddPostEvent({
    required this.post,
  });
  @override
  List<Object> get props => [post];
}

class DeletePostEvent extends PostOpreationsEvent {
  final int postId;
  const DeletePostEvent({
    required this.postId,
  });
  @override
  List<Object> get props => [postId];
}

class UpdatePostEvent extends PostOpreationsEvent {
  final Post post;
  const UpdatePostEvent({
    required this.post,
  });

  @override
  List<Object> get props => [post];
}
