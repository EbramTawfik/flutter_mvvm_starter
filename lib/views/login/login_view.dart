library login_view;

import 'package:flutter_mvvm_starter/core/constants/route_paths.dart';
import 'package:flutter_mvvm_starter/theme/app_colors.dart';
import 'package:flutter_mvvm_starter/widgets/login_header/login_header_widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'login_view_model.dart';

part 'login_mobile.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LoginViewModel(
            authenticationService: Provider.of(context, listen: false)),
        child: Consumer<LoginViewModel>(
          builder: (context, viewModel, child) {
            return ScreenTypeLayout(
              mobile: _LoginMobile(viewModel),
              desktop: _LoginMobile(viewModel),
              tablet: _LoginMobile(viewModel),
            );
          },
        ));
  }
}
