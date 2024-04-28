import 'package:base_architecture/presentation/bloc/base_bloc.dart';

abstract class HomePageEvent extends BaseEvent{}

class Initialize extends HomePageEvent{
  final String username;
  Initialize(this.username);
}

class OnChangeTab extends HomePageEvent{
  final int tabIndex;

  OnChangeTab(this.tabIndex);

  @override
  int get hashCode => Object.hash(17,tabIndex);

  @override
  bool operator == (Object other) =>
      other is OnChangeTab 
      && tabIndex == other.tabIndex; 
}
