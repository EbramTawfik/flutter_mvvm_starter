library login_header_widget;

import 'package:flutter_mvvm_starter/theme/text_styles.dart';
import 'package:flutter_mvvm_starter/theme/ui_helpers.dart';
import 'package:flutter_mvvm_starter/views/login/login_view_model.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'login_header_mobile.dart';

class LoginHeaderWidget extends StatelessWidget {
  final String validationMessage;

  LoginHeaderWidget({this.validationMessage});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _LoginHeaderMobile(),
      desktop: _LoginHeaderMobile(),
      tablet: _LoginHeaderMobile(),
    );
  }
}
