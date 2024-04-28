import 'package:base_app/architecture/presentation/bloc/base_bloc.dart';

abstract class LoginPageEvent extends BaseEvent{}

class Login extends LoginPageEvent{
  final String username;
  final String password;

  Login(this.username, this.password);
}


