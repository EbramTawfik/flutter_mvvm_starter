import 'package:flutter/material.dart';
import 'package:flutter_mvvm_starter/core/models/user.dart';

class ConfigService extends ChangeNotifier {
  User? _user;

  User? get user => _user;
  set user(User? u) {
    _user = u;
    notifyListeners();
  }
}
