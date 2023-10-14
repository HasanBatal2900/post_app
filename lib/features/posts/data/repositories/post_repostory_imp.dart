import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/post_remote_data_source.dart';
import '../models/post_model.dart';
import '../../domain/entities/post.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/repositories/post_repo.dart';
import '../datasources/post_local_data_source.dart';

typedef Future<Unit> Function() deleteOrUpdateOrAddPost();

class PostRepositoryImp implements PostRepository {
  @override
  PostRepositoryImp(
      {required this.postLocalDataSourceImp,
      required this.postRemoteDataSourceImp,
      required this.networkInfoImb});
  final PostRemoteDataSourceImp postRemoteDataSourceImp;
  final PostLocalDataSourceImp postLocalDataSourceImp;
  final NetworkInfoImb networkInfoImb;
  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await networkInfoImb.statusConnection) {
      try {
        final remotePosts = await postRemoteDataSourceImp.getAllPost();
        postLocalDataSourceImp.addCachePosts(remotePosts);
        return right(remotePosts);
      } on ServerException {
        left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await postLocalDataSourceImp.getCachcedPosts();
        return right(localPosts);
      } on EmptyCacheException {
        return left(EmptyCacheFailure());
      }
    }
    return left(OfflineFailure());
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    final postModel =
        PostModel(id: post.id, title: post.title, body: post.body);
    if (await networkInfoImb.statusConnection) {
      try {
        postRemoteDataSourceImp.addPost(postModel);
  
        return right(unit);
      } on ServerException {
        return left(ServerFailure());
      }
    }
    return Left(OfflineFailure());
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async {
    final postModel =
        PostModel(id: post.id, title: post.title, body: post.body);
    if (await networkInfoImb.statusConnection) {
      try {
        postRemoteDataSourceImp.updatePost(postModel);
        return right(unit);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) async {
    if (await networkInfoImb.statusConnection) {
      try {
        postRemoteDataSourceImp.deletPost(id);
        return right(unit);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }

  checkStatus(deleteOrUpdateOrAddPost deleteOrUpdateOrAddPost) async {
    if (await networkInfoImb.statusConnection) {
      try {
       deleteOrUpdateOrAddPost();
        return right(unit);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }
}
