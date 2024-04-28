import 'package:base_app/base/bloc/base_state.dart';
import 'package:base_app/base/bloc/page_status.dart';
import 'package:base_app/example/presentation/pokemonlist/model/pokemon_list_ui_model.dart';

class PokemonListState extends BaseState{

  final PokemonListUIModel uiModel;
  
  const PokemonListState({required super.pageStatus, required this.uiModel});

  @override
  PokemonListState copyWith({
    PageStatus? pageStatus,
    PokemonListUIModel? uiModel,
    }) {
    return PokemonListState(
      pageStatus: pageStatus ?? this.pageStatus,
      uiModel: uiModel?? this.uiModel
    );
  }
  
  @override
  List<Object?> get props => [pageStatus,uiModel];
  
}