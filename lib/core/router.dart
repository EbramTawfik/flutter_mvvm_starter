import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mvvm_starter/core/constants/route_paths.dart';
import 'package:flutter_mvvm_starter/core/models/post.dart';
import 'package:flutter_mvvm_starter/views/home/home_view.dart';
import 'package:flutter_mvvm_starter/views/login/login_view.dart';
import 'package:flutter_mvvm_starter/views/post/post_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute(
            settings: settings, builder: (_) => HomeView());
      case RoutePaths.Login:
        return MaterialPageRoute(
            settings: settings, builder: (_) => LoginView());
      case RoutePaths.Post:
        var post = settings.arguments as Post;
        return MaterialPageRoute(
            settings: settings, builder: (_) => PostView(post: post));
      default:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
