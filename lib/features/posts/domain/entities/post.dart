import 'package:equatable/equatable.dart';

class Post extends Equatable {
  const Post({required this.body,  this.id, required this.title});

  final String title;
  final String body;
  final int? id;

  @override
  List<Object?> get props => [title, body, id];
}
