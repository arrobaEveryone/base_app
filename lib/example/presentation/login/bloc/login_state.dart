import 'package:base_app/base/bloc/base_state.dart';
import 'package:base_app/base/bloc/page_status.dart';
import 'package:base_app/example/presentation/login/models/login_ui_model.dart';

class LoginState extends BaseState{

  final LoginUIModel uiModel;

  const LoginState({required super.pageStatus, required this.uiModel});
  
  @override
  LoginState copyWith({
     PageStatus? pageStatus,
    LoginUIModel? uiModel
  }) => LoginState(
      pageStatus: pageStatus?? this.pageStatus,
      uiModel: uiModel?? this.uiModel
    );
    
    @override
    List<Object?> get props => [uiModel,pageStatus];

}