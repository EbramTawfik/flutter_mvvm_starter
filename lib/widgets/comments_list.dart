import 'package:flutter_mvvm_starter/views/post/post_view_model.dart';
import 'package:flutter_mvvm_starter/widgets/comment_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CommentsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PostViewModel>(context);
    return viewModel.busy
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: viewModel.comments.length,
            itemBuilder: (context, index) =>
                CommentItem(viewModel.comments[index]),
          );
  }
}
