import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/post_repo.dart';

import '../entities/post.dart';

class AddPostUseCase {
  final PostRepository repostory;
  AddPostUseCase({required this.repostory});

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repostory.addPost(post);
  }
}
