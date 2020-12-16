import 'package:flutter_mvvm_starter/core/services/api.dart';
import 'package:flutter_mvvm_starter/core/services/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'models/user.dart';

class ProviderInjector {
  static List<SingleChildWidget> providers = [
    ..._independentServices,
    ..._dependentServices,
    ..._consumableServices,
  ];

  static List<SingleChildWidget> _independentServices = [
    Provider.value(value: Api()),
  ];

  static List<SingleChildWidget> _dependentServices = [
    ProxyProvider<Api, AuthenticationService>(
      update: (context, api, authenticationService) =>
          AuthenticationService(api: api),
    )
  ];

  static List<SingleChildWidget> _consumableServices = [
    StreamProvider<User>(
      create: (context) =>
          Provider.of<AuthenticationService>(context, listen: false).user,
    )
  ];
}
