import 'package:base_architecture/presentation/bloc/base_bloc.dart';
import 'package:base_architecture/presentation/bloc/page_status.dart';
import 'package:base_app/example/domain/usecases/get_list_pokemon_usecase.dart';
import 'package:base_app/example/lib/di/domain_service_locator/domain_service_locator.dart';
import 'package:base_app/example/presentation/pokemonlist/bloc/pokemon_list_event.dart';
import 'package:base_app/example/presentation/pokemonlist/bloc/pokemon_list_state.dart';
import 'package:base_app/example/presentation/pokemonlist/model/pokemon_list_ui_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonListBloc extends BaseBloc<PokemonListPageEvent, PokemonListState>{

  final GetListPokemonUseCase _getListPokemonUseCase = DomainService.getListPokemonUseCase;

  PokemonListBloc() : super(PokemonListState(pageStatus: IdleStatus(), uiModel: PokemonListUIModel())){
    on<OnInitialize>(((event, emit) => executeInitialize(event,emit)));
    on<OnSearchBarChange>(((event, emit) => executeSearchBarChange(event,emit)));
    on<OnSearchPressed>(((event, emit) => executeSearchPressed(event,emit)));
    on<OnStopSearchPressed>(((event, emit) => executeStopSearchPressed(event,emit)));
  }

  /// =====================================================================
  /// =====================================================================
  executeInitialize(OnInitialize event, Emitter<PokemonListState> emit) async {
    if(state.uiModel.pokemonList.isEmpty){
      emit(state.copyWith(pageStatus: LoadingStatus()));
      await execute(
        _getListPokemonUseCase, 
        GetPokemonsParams(page: 0, limit: event.numInitPokemon), 
        (pokemonList) => {emit(state.copyWith(pageStatus: SuccessState(), uiModel: PokemonListUIModel(completePokemonList: pokemonList, pokemonList: pokemonList)))}, 
        (error) => {emit(state.copyWith(pageStatus: ErrorStatus(error)))}
      );
    }
  }
  
  ///=====================================================================
  ///=====================================================================
  executeSearchBarChange(OnSearchBarChange event, Emitter<PokemonListState> emit) {
    if(event.value.isEmpty){
       emit(state.copyWith(pageStatus: SuccessState(), uiModel: state.uiModel.copyWith(pokemonList: state.uiModel.completePokemonList)));
    }else{
      var list = state.uiModel.completePokemonList.where((element) => element.name.toLowerCase().contains(event.value.toLowerCase())).toList();
      emit(state.copyWith(pageStatus: SuccessState(), uiModel: state.uiModel.copyWith(pokemonList: list)));
    }
  }

  ///=====================================================================
  ///=====================================================================
  executeSearchPressed(OnSearchPressed event, Emitter<PokemonListState> emit) {
    emit(state.copyWith(uiModel: state.uiModel.copyWith(isSearching: true)));
  }

  ///=====================================================================
  ///=====================================================================
  executeStopSearchPressed(OnStopSearchPressed event, Emitter<PokemonListState> emit) {
    emit(state.copyWith(uiModel: state.uiModel.copyWith(isSearching: false, pokemonList: state.uiModel.completePokemonList)));
  }

}