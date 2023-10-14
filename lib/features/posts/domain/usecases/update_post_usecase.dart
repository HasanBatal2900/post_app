import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/post.dart';
import '../repositories/post_repo.dart';

class UpdatePostUseCase {
  final PostRepository repostory;

  UpdatePostUseCase({required this.repostory});

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repostory.updatePost(post);
  }
}
