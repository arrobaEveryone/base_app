import 'package:base_app/architecture/presentation/bloc/base_bloc.dart';

sealed class TranslatedPageEvent extends BaseEvent{}

class OnSwitchChange extends TranslatedPageEvent{
  final bool newValue;
  OnSwitchChange({required this.newValue});
}