
import 'package:base_app/base/bloc/base_bloc.dart';
import 'package:base_app/base/bloc/page_status.dart';
import 'package:base_app/example/presentation/home/bloc/home_state.dart';
import 'package:base_app/example/presentation/home/model/home_ui_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';

class HomeBloc extends BaseBloc<HomePageEvent, HomeState> {
  
  HomeBloc() : super(
    HomeState(uiModel: HomeUIModel(), pageStatus:IdleStatus(), currentTabIndex: 0)
  ) {
    on<Initialize>((event, emit) => executeInitialize(event,emit));
    on<OnChangeTab>((event, emit) => executeOnChangeTab(event,emit));
  }

  executeInitialize(Initialize event, Emitter<HomeState> emit) {
    emit(state.copyWith(uiModel: HomeUIModel(username: event.username)));
  }

 executeOnChangeTab(OnChangeTab event, Emitter<HomeState> emit) {
  emit(state.copyWith(currentTabIndex: event.tabIndex));
 }
}

