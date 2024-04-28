 import 'package:base_app/example/lib/approuter/app_router.dart';
import 'package:flutter/cupertino.dart';
import '../../home/navigation/home_arguments.dart';

Future<void> navigateToHome(BuildContext context, String username) async {
    final arguments = HomeArguments(username: username);
    await Navigator.pushReplacementNamed(context, AppRouter.homeRoute, arguments: arguments);
}