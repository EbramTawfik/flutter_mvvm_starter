library comment_list_item_widget;

import 'package:flutter_mvvm_starter/core/models/comment.dart';
import 'package:flutter_mvvm_starter/theme/app_colors.dart';
import 'package:flutter_mvvm_starter/theme/ui_helpers.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'comment_item_mobile.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;
  const CommentItem(this.comment);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _CommentItemMobile(comment),
      desktop: _CommentItemMobile(comment),
      tablet: _CommentItemMobile(comment),
    );
  }
}
