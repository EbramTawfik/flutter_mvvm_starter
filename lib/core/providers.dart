import 'package:flutter_mvvm_starter/core/services/api.dart';
import 'package:flutter_mvvm_starter/core/services/authentication_service.dart';
import 'package:flutter_mvvm_starter/core/services/config_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

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
    ChangeNotifierProvider<ConfigService>(create: (context) => ConfigService()),
  ];
}
