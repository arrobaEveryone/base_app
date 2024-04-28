import 'package:base_architecture/presentation/bloc/base_bloc.dart';
import 'package:base_architecture/presentation/bloc/page_status.dart';
import 'package:base_app/example/presentation/camera/bloc/camera_event.dart';
import 'package:base_app/example/presentation/camera/bloc/camera_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CameraBloc extends BaseBloc<CameraPageEvent, CameraState> {
  
  CameraBloc() : super(
    CameraState(pageStatus:IdleStatus())
  ) {
    on<Initialize>((event, emit) => executeInitialize(event,emit));
  }

  executeInitialize(Initialize event, Emitter<CameraState> emit) {
    
  }
}
