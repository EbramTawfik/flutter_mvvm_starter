import 'dart:convert';

import 'package:flutter_mvvm_starter/core/base/base_http_service.dart';
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
    // parse into List
    var parsed = await getList('$endpoint/posts?userId=$userId');
    // loop and convert each item to Post
    return parsed.map((p) => Post.fromJson(p)).toList();
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    var parsed = await getList('$endpoint/comments?postId=$postId');
    // Loop and convert each item to a Comment
    return parsed.map((c) => Comment.fromJson(c)).toList();
  }
}
