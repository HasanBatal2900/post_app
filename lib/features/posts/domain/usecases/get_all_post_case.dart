import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/post.dart';
import '../repositories/post_repo.dart';

class GetAllPostsUseCase {
  final PostRepository repostory;
  GetAllPostsUseCase({required this.repostory});

  Future<Either<Failure, List<Post>>> call() async {
    return await repostory.getAllPosts();
  }
}
