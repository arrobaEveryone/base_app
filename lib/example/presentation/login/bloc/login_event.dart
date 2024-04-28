import 'package:base_app/base/bloc/base_bloc.dart';

abstract class LoginPageEvent extends BaseEvent{}

class Login extends LoginPageEvent{
  final String username;
  final String password;

  Login(this.username, this.password);
}


