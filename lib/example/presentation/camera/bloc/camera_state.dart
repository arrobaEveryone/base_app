import '../../../../architecture/presentation/bloc/base_state.dart';
import '../../../../architecture/presentation/bloc/page_status.dart';

class CameraState extends BaseState{
  const CameraState({
    required super.pageStatus,
    });
  
  @override
  CameraState copyWith({
     PageStatus? pageStatus,
  }) => CameraState(
      pageStatus: pageStatus?? this.pageStatus,
    );


  @override
  List<Object?> get props => [pageStatus];

}