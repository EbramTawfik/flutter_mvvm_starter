library posts_list_widget;

import 'package:flutter_mvvm_starter/core/constants/route_paths.dart';
import 'package:flutter_mvvm_starter/views/home/home_view_model.dart';
import 'package:flutter_mvvm_starter/widgets/post_list_item/post_item.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'posts_list_mobile.dart';

class PostsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    return ScreenTypeLayout(
      mobile: _PostsListMobile(viewModel),
      desktop: _PostsListMobile(viewModel),
      tablet: _PostsListMobile(viewModel),
    );
  }
}
