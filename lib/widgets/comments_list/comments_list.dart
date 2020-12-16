library comments_list_widget;

import 'package:flutter_mvvm_starter/views/post/post_view_model.dart';
import 'package:flutter_mvvm_starter/widgets/commen_list_item/comment_item.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'comments_list_mobile.dart';

class CommentsList extends StatelessWidget {
  final int postId;
  CommentsList(this.postId);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PostViewModel>(context);
    return ScreenTypeLayout(
      mobile: _CommentsListMobile(postId, viewModel),
      desktop: _CommentsListMobile(postId, viewModel),
      tablet: _CommentsListMobile(postId, viewModel),
    );
  }
}
