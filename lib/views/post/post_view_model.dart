import 'package:flutter_mvvm_starter/core/base/base_view_model.dart';
import 'package:flutter_mvvm_starter/core/models/comment.dart';
import 'package:flutter_mvvm_starter/core/services/api.dart';

class PostViewModel extends BaseViewModel {
  late final Api _api;

  PostViewModel({
    required Api api,
  }) : _api = api;

  List<Comment> comments = [];

  Future fetchComments(int postId) async {
    busy = true;
    comments = await _api.getCommentsForPost(postId);
    busy = false;
    notifyListeners();
  }

  @override
  void dispose() {
    print('I have been disposed!!');
    super.dispose();
  }
}
