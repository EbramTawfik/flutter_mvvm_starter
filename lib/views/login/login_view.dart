import 'package:flutter_mvvm_starter/core/constants/route_paths.dart';
import 'package:flutter_mvvm_starter/theme/app_colors.dart';
import 'package:flutter_mvvm_starter/widgets/login_header_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'login_view_model.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LoginViewModel(
            authenticationService: Provider.of(context, listen: false)),
        child: Consumer<LoginViewModel>(
          builder: (context, viewModel, child) {
            return _buildView(viewModel, context);
          },
        ));
  }

  Widget _buildView(LoginViewModel viewModel, BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginHeaderWidget(),
            viewModel.busy
                ? CircularProgressIndicator()
                : FlatButton(
                    color: Colors.white,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      var loginSuccess =
                          await viewModel.login(viewModel.userName);
                      if (loginSuccess) {
                        Navigator.pushNamed(context, RoutePaths.Home);
                      }
                    },
                  )
          ],
        ));
  }
}
