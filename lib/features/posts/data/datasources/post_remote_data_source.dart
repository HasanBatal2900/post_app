// import 'dart:convert';
// import 'dart:developer';

import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:post_app/core/errors/exceptions.dart';
import 'package:post_app/features/posts/data/models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPost();
  Future<Unit> addPost(PostModel post);
  Future<Unit> deletPost(int id);
  Future<Unit> updatePost(PostModel post);
}

class PostRemoteDataSourceImp extends PostRemoteDataSource {
  final baseUrl = "https://jsonplaceholder.typicode.com/";
  @override
  Future<List<PostModel>> getAllPost() async {
    const endPoint = "posts/";
    final response = await http.get(
      Uri.parse(
        baseUrl + endPoint,
      ),
      headers: {"Content_Type": "application/json"},
    );
    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      List<PostModel> postModels =
          jsonData.map((post) => PostModel.fromJson(post)).toList();
      return postModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addPost(PostModel post) async {
    const endPoint = "posts/";
    final response = await http.post(Uri.parse(baseUrl + endPoint), headers: {
      "Content_Type": "application/json"
    }, body: {
      "body": post.body,
      "title": post.title,
    });
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      //201 in post and  202 put requst as mean success requst
      // 200 in get reqeuts 
      log(response.statusCode.toString());
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletPost(int id) async {
    final endPoint = "posts/${id.toString()}";
    final response = await http.delete(
      Uri.parse(baseUrl + endPoint),
      headers: {"Content_Type": "application/json"},
    );
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePost(PostModel post) async {
    final endPoint = "posts/${post.id.toString()}";
    final response = await http.patch(
      Uri.parse(baseUrl + endPoint),
      headers: {"Content_Type": "application/json"},
      body: {
        "title": post.title,
        "body": post.body,
      },
    );
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
