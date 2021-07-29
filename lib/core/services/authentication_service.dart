import 'dart:async';

import 'package:flutter_mvvm_starter/core/base/base_service.dart';
import 'package:flutter_mvvm_starter/core/models/user.dart';
import 'package:flutter_mvvm_starter/core/services/api.dart';

class AuthenticationService extends BaseService {
  final Api _api;

  AuthenticationService({Api api}) : _api = api;

  Future<User> login(int userId) async {
    var fetchedUser = await _api.getUserProfile(userId);

    return fetchedUser;
  }
}
