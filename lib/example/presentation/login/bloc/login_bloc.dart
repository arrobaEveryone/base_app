
import 'package:base_app/architecture/presentation/bloc/base_bloc.dart';
import 'package:base_app/architecture/presentation/bloc/page_status.dart';
import 'package:base_app/example/presentation/login/bloc/login_event.dart';
import 'package:base_app/example/presentation/login/bloc/login_state.dart';
import 'package:base_app/example/presentation/login/models/login_ui_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends BaseBloc<LoginPageEvent, LoginState> {
  
  LoginBloc() : super(LoginState(pageStatus:IdleStatus(), uiModel: LoginUIModel())){
    on<Login>(((event, emit) => executeLoginEvent(event,emit)));
  }

  
  void executeLoginEvent(Login event, Emitter<LoginState> emit) async{

    // loading
    emit(state.copyWith(pageStatus: LoadingStatus()));
   
    // simular carga
    await Future.delayed(const Duration(milliseconds: 500));

    // success
    emit(state.copyWith(pageStatus: SuccessState(), uiModel: LoginUIModel(username: event.username, password: event.password)));
  }
}