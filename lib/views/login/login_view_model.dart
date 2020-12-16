import 'package:flutter/widgets.dart';
import 'package:flutter_mvvm_starter/core/base/base_view_model.dart';
import 'package:flutter_mvvm_starter/core/services/authentication_service.dart';

class LoginViewModel extends BaseViewModel {
  AuthenticationService _authenticationService;
  String _userName;

  LoginViewModel({
    @required AuthenticationService authenticationService,
  }) : _authenticationService = authenticationService;

  Future<bool> login(String userIdText) async {
    busy = true;
    var userId = int.tryParse(userIdText);
    var success = await _authenticationService.login(userId);
    busy = false;
    return success;
  }

  set userName(String user) {
    this._userName = user;
    notifyListeners();
  }

  get userName {
    return _userName;
  }
}
