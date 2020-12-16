part of login_view;

class _LoginMobile extends StatelessWidget {
  final LoginViewModel viewModel;
  _LoginMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
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
