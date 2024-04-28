import 'package:base_app/example/presentation/home/pages/home_page.dart';
import 'package:base_app/example/presentation/login/pages/login_page.dart';
import 'package:flutter/material.dart';

import '../../presentation/home/navigation/home_arguments.dart';

class AppRouter {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case homeRoute:
        final arguments = settings.arguments as HomeArguments;
        return MaterialPageRoute(builder: (_) => HomePage(username: arguments.username));
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('Unknown Route'))));
    }
  }

}