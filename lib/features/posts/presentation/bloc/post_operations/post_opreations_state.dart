// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'post_opreations_bloc.dart';

sealed class PostOpreationsState extends Equatable {
  const PostOpreationsState();

  @override
  List<Object> get props => [];
}

final class PostOpreationsInitial extends PostOpreationsState {}

class LoadingAddorDeleteorUpdateState extends PostOpreationsState {
}

class ErrorAddorDeleteorUpdateState extends PostOpreationsState {
  final String errorMessage;
  const ErrorAddorDeleteorUpdateState({
    required this.errorMessage,
  });
}

class MessageAddorDeleteorUpdateState extends PostOpreationsState {
  final String message;
  const MessageAddorDeleteorUpdateState({
    required this.message,
  });
}
