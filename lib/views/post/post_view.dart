library post_view;

import 'package:flutter_mvvm_starter/core/models/post.dart';
import 'package:flutter_mvvm_starter/core/models/user.dart';
import 'package:flutter_mvvm_starter/theme/app_colors.dart';
import 'package:flutter_mvvm_starter/theme/text_styles.dart';
import 'package:flutter_mvvm_starter/theme/ui_helpers.dart';
import 'package:flutter_mvvm_starter/widgets/comments_list/comments_list.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'post_view_model.dart';

part 'post_mobile.dart';

class PostView extends StatelessWidget {
  final Post post;
  const PostView({Key key, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PostViewModel vm = PostViewModel(api: Provider.of(context));
    vm.fetchComments(post.id);
    return ChangeNotifierProvider(
        create: (context) => vm,
        child: Consumer<PostViewModel>(
          builder: (context, viewModel, child) {
            return ScreenTypeLayout(
              mobile: _PostMobile(vm, post),
              desktop: _PostMobile(vm, post),
              tablet: _PostMobile(vm, post),
            );
          },
        ));
  }
}
