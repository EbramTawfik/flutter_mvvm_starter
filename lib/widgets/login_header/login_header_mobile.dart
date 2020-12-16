part of login_header_widget;

class _LoginHeaderMobile extends StatelessWidget {
  final String validationMessage;

  _LoginHeaderMobile({this.validationMessage});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Login', style: headerStyle),
      UIHelper.verticalSpaceMedium,
      Text('Enter a number between 1 - 10', style: subHeaderStyle),
      LoginTextField(),
      this.validationMessage != null
          ? Text(validationMessage, style: TextStyle(color: Colors.red))
          : Container()
    ]);
  }
}

class LoginTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<LoginViewModel>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      height: 50.0,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: TextField(
        decoration: InputDecoration.collapsed(hintText: 'User Id'),
        onChanged: (newValue) => vm.userName = newValue,
      ),
    );
  }
}
