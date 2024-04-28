import '../../../../architecture/presentation/bloc/base_state.dart';
import '../../../../architecture/presentation/bloc/page_status.dart';
import '../model/home_ui_model.dart';

class HomeState extends BaseState{

  final HomeUIModel uiModel;
  final int currentTabIndex;

  const HomeState({
    required super.pageStatus, 
    required this.uiModel,
    required this.currentTabIndex
    });
  
  @override
  HomeState copyWith({
     PageStatus? pageStatus,
     HomeUIModel? uiModel,
     int? currentTabIndex,
  }) => HomeState(
    currentTabIndex: currentTabIndex?? this.currentTabIndex,
      pageStatus: pageStatus?? this.pageStatus,
      uiModel: uiModel?? this.uiModel
    );


  
  @override
  List<Object?> get props => [pageStatus,uiModel,currentTabIndex];

}