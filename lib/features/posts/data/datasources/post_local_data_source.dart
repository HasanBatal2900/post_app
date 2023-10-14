// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:post_app/core/errors/exceptions.dart';
import 'package:post_app/features/posts/data/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getCachcedPosts();
  Future<Unit> addCachePosts(List<PostModel> postModels);
}

class PostLocalDataSourceImp implements PostLocalDataSource {
  final cahcedKey = "CACHED_POSTS";
  final SharedPreferences sharedPreferences;
  PostLocalDataSourceImp({
    required this.sharedPreferences,
  });

  @override
  Future<Unit> addCachePosts(List<PostModel> postModels) {
    final postModelsAdded = postModels
        .map<Map<String, dynamic>>((postModel) => postModel.toJson())
        .toList();
    sharedPreferences.setString(cahcedKey, json.encode(postModelsAdded));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachcedPosts() {
    final jsonString = sharedPreferences.getString(cahcedKey);
    if (jsonString != null) {
      List jsonToPostModel = json.decode(jsonString);

      List<PostModel> savedPosts = jsonToPostModel
          .map<PostModel>(
            (postModel) => PostModel.fromJson(postModel),
          )
          .toList();
      return Future.value(savedPosts);
    } else {
      throw OfflineException();
    }
  }
}
