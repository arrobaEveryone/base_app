import 'package:base_app/base/bloc/base_bloc.dart';
import 'package:base_app/base/bloc/page_status.dart';
import 'package:base_app/example/presentation/translated/bloc/translated_page_event.dart';
import 'package:base_app/example/presentation/translated/bloc/translated_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TranslatedBloc extends BaseBloc<TranslatedPageEvent,TranslatedState>{
  
  TranslatedBloc() : super(TranslatedState(pageStatus: IdleStatus())){
    on<OnSwitchChange>(((event, emit) => executeSwitchChange(event,emit)));
  }


  executeSwitchChange(OnSwitchChange event, Emitter<TranslatedState> emit) {
    emit(state.copyWith(currentValue: event.newValue));
  }

}

