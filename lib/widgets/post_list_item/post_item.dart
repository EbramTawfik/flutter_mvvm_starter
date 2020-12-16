library post_list_item_widget;

import 'package:flutter_mvvm_starter/core/models/post.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'post_item_mobile.dart';

class PostItem extends StatelessWidget {
  final Post post;
  final Function onTap;
  const PostItem({this.post, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _PostItemMobile(
        post: post,
        onTap: onTap,
      ),
      desktop: _PostItemMobile(
        post: post,
        onTap: onTap,
      ),
      tablet: _PostItemMobile(
        post: post,
        onTap: onTap,
      ),
    );
  }
}
