import 'package:flutter_mvvm_starter/core/models/post.dart';
import 'package:flutter_mvvm_starter/core/models/user.dart';
import 'package:flutter_mvvm_starter/core/services/config_service.dart';
import 'package:flutter_mvvm_starter/theme/app_colors.dart';
import 'package:flutter_mvvm_starter/theme/text_styles.dart';
import 'package:flutter_mvvm_starter/theme/ui_helpers.dart';
import 'package:flutter_mvvm_starter/widgets/comments_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'post_view_model.dart';

class PostView extends StatelessWidget {
  late final Post post;
  PostView({required this.post});
  @override
  Widget build(BuildContext context) {
    PostViewModel vm = PostViewModel(api: Provider.of(context));
    vm.fetchComments(post.id ?? 0);
    return ChangeNotifierProvider(
        create: (context) => vm,
        child: Consumer<PostViewModel>(
          builder: (context, viewModel, child) {
            return _buildView(context, viewModel, post);
          },
        ));
  }

  Widget _buildView(BuildContext context, PostViewModel viewModel, Post post) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceLarge,
            Text(post.title ?? "", style: headerStyle),
            Text(
              'by ${Provider.of<ConfigService>(context).user?.name ?? ""}',
              style: TextStyle(fontSize: 9.0),
            ),
            UIHelper.verticalSpaceMedium,
            Text(post.body ?? ""),
            Expanded(child: CommentsList())
          ],
        ),
      ),
    );
  }
}
