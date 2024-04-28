import 'package:base_app/base/bloc/base_bloc.dart';

sealed class TranslatedPageEvent extends BaseEvent{}

class OnSwitchChange extends TranslatedPageEvent{
  final bool newValue;
  OnSwitchChange({required this.newValue});
}