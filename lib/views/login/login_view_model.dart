import 'package:flutter_mvvm_starter/core/base/base_view_model.dart';
import 'package:flutter_mvvm_starter/core/services/authentication_service.dart';
import 'package:flutter_mvvm_starter/core/services/config_service.dart';

class LoginViewModel extends BaseViewModel {
  late final AuthenticationService _authenticationService;
  late final ConfigService _configService;
  String _userName = "";
  LoginViewModel({
    required AuthenticationService authenticationService,
    required ConfigService configService,
  })  : _authenticationService = authenticationService,
        _configService = configService;

  Future<bool> login(String userIdText) async {
    busy = true;
    var userId = int.tryParse(userIdText);
    if (userId == null) return false;
    var user = await _authenticationService.login(userId);
    bool success = user != null;
    if (success) {
      _configService.user = user;
    }
    busy = false;
    return success;
  }

  set userName(String user) {
    this._userName = user;
    notifyListeners();
  }

  String get userName {
    return _userName;
  }
}
