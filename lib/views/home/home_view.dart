library home_view;

import 'package:flutter_mvvm_starter/core/models/user.dart';
import 'package:flutter_mvvm_starter/theme/app_colors.dart';
import 'package:flutter_mvvm_starter/theme/text_styles.dart';
import 'package:flutter_mvvm_starter/theme/ui_helpers.dart';
import 'package:flutter_mvvm_starter/widgets/posts_list/posts_list.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'home_view_model.dart';

part 'home_mobile.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = HomeViewModel(api: Provider.of(context));
    viewModel.getPosts(Provider.of<User>(context).id);
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: ScreenTypeLayout(
          mobile: _HomeMobile(viewModel),
          desktop: _HomeMobile(viewModel),
          tablet: _HomeMobile(viewModel),
        ));
  }
}
