import 'package:flutter_mvvm_starter/core/constants/route_paths.dart';
import 'core/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mvvm_starter/core/router.dart' as Router;

void main() async {
  runApp(MainApplication());
}

class MainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderInjector.providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutePaths.Login,
        onGenerateRoute: Router.Router.generateRoute,
      ),
    );
  }
}
