library home_view;

import 'package:flutter_mvvm_starter/core/models/user.dart';
import 'package:flutter_mvvm_starter/core/services/config_service.dart';
import 'package:flutter_mvvm_starter/theme/app_colors.dart';
import 'package:flutter_mvvm_starter/theme/text_styles.dart';
import 'package:flutter_mvvm_starter/theme/ui_helpers.dart';
import 'package:flutter_mvvm_starter/widgets/posts_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<ConfigService>(context).user;
    if (user == null) return Container();
    var vm = HomeViewModel(api: Provider.of(context));
    vm.getPosts(user.id ?? 0);
    return ChangeNotifierProvider(
        create: (context) => vm,
        child: Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            return _buildView(context, viewModel);
          },
        ));
  }

  Widget _buildView(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UIHelper.verticalSpaceLarge,
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Welcome ${Provider.of<ConfigService>(context).user?.name ?? ""}',
              style: headerStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('Here are all your posts', style: subHeaderStyle),
          ),
          UIHelper.verticalSpaceSmall,
          Expanded(
            child: PostsList(),
          )
        ],
      ),
    );
  }
}
