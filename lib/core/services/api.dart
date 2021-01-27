import 'dart:convert';

import 'package:flutter_mvvm_starter/core/base/base_http_service.dart';
import 'package:flutter_mvvm_starter/core/http/http_response.dart';
import 'package:flutter_mvvm_starter/core/models/comment.dart';
import 'package:flutter_mvvm_starter/core/models/post.dart';
import 'package:flutter_mvvm_starter/core/models/user.dart';

/// The service responsible for networking requests
class Api extends BaseHttpService {
  @override
  get endpoint {
    return 'https://jsonplaceholder.typicode.com';
  }

  Future<User> getUserProfile(int userId) async {
    // Get user profile for id
    var response = await client.get('$endpoint/users/$userId');

    // Convert and return
    return User.fromJson(json.decode(response.body));
  }

  Future<List<Post>> getPostsForUser(int userId) async {
    HttpResponse result = await get('$endpoint/posts?userId=$userId');
    List<Post> posts = [];
    if (result.succes) {
      posts =
          (result.body as List<dynamic>).map((p) => Post.fromJson(p)).toList();
    }
    return posts;
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    HttpResponse result = await get('$endpoint/comments?postId=$postId');
    List<Comment> comments = [];
    if (result.succes) {
      comments = (result.body as List<dynamic>)
          .map((c) => Comment.fromJson(c))
          .toList();
    }
    return comments;
  }
}
