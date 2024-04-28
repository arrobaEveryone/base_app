import 'package:base_app/base/bloc/base_state.dart';
import 'package:base_app/base/bloc/page_status.dart';

class TranslatedState extends BaseState{
  
  final bool currentValue;

  const TranslatedState({required super.pageStatus, this.currentValue = false});

  @override
  TranslatedState copyWith({PageStatus? pageStatus, bool? currentValue}) {
    return TranslatedState(
      pageStatus: pageStatus?? this.pageStatus, 
      currentValue: currentValue?? this.currentValue
    );
  }

  @override
  List<Object?> get props => [pageStatus,currentValue];

}