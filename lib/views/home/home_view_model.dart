import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_starter/core/base/base_view_model.dart';
import 'package:flutter_mvvm_starter/core/models/post.dart';
import 'package:flutter_mvvm_starter/core/services/api.dart';

class HomeViewModel extends BaseViewModel {
  Api _api;
  List<Post> posts = [];

  HomeViewModel({
    @required Api api,
  }) : _api = api;
  Future getPosts(int userId) async {
    if (userId != null) {
      busy = true;
      posts = await _api.getPostsForUser(userId);
      busy = false;
      notifyListeners();
    }
  }
}
