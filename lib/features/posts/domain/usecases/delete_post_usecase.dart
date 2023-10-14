import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/post_repo.dart';

class DeletePostUseCase {
  final PostRepository repostory;

  DeletePostUseCase({required this.repostory});

  Future<Either<Failure, Unit>> call(int id) async {
    return await repostory.deletePost(id);
  }
}
