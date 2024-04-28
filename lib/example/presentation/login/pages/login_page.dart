
import 'package:base_app/architecture/presentation/bloc/page_status.dart';
import 'package:base_app/architecture/presentation/pages/base_scaffold_page.dart';
import 'package:base_app/example/presentation/login/bloc/login_bloc.dart';
import 'package:base_app/example/presentation/login/bloc/login_event.dart';
import 'package:base_app/example/presentation/login/bloc/login_state.dart';
import 'package:flutter/material.dart';
import '../navigation/login_navigation.dart';

class LoginPage extends BaseScaffoldPage<LoginPageEvent, LoginState> {
  
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginStatePage();
}


class _LoginStatePage extends BaseScaffoldPageState<LoginPageEvent, LoginState, LoginBloc>{

  _LoginStatePage() : super(LoginBloc());

  @override
  void blocListener(BuildContext context, LoginState state) {
    super.blocListener(context, state);
    if(state.pageStatus is SuccessState){
      showSnackBar(context, state, true);
      navigateToHome(context, state.uiModel.username);
    }
  }

  @override
  Widget buildSnackBar(BuildContext context, LoginState state) {
    switch(state.pageStatus.runtimeType){
      case SuccessState: return const Text("Success");
      case ErrorStatus: return const Text("Error");
      default: return const SizedBox();
    }
  }

  
  @override
  Widget buildContent(BuildContext context, LoginState state) {

    switch(state.pageStatus.runtimeType){
      case IdleStatus:
      case SuccessState: return _buildFormLogin(state);
      case LoadingStatus: return  _buildLoading(state);
      case ErrorStatus: return _buildError(state);
      default: return const SizedBox();
    }
  }

  Widget _buildFormLogin(LoginState state){
    return  Center(
      child: ElevatedButton(
            onPressed: () {
              bloc.add(Login("username xDDD", "password"));
            },
            child: const Text("Login"),
      )
    );
  }

  Widget _buildError(LoginState state){
    return  Center(
      child:  Text(state.pageStatus.runtimeType.toString()),
    );
  }

  Widget _buildLoading(LoginState state){
    return  Center(
      child:  Text(state.pageStatus.runtimeType.toString()),
    );
  }
  
}