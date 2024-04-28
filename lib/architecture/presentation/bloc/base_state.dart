import 'package:base_app/architecture/presentation/bloc/page_status.dart';
import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  final PageStatus pageStatus;

  const BaseState({required this.pageStatus});

  BaseState copyWith({
    PageStatus? pageStatus,
  });

}