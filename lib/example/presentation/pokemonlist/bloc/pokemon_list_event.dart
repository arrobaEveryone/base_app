import 'package:base_architecture/presentation/bloc/base_bloc.dart';

sealed class PokemonListPageEvent extends BaseEvent{
  const PokemonListPageEvent(); 
}

class OnInitialize extends PokemonListPageEvent{
  final int numInitPokemon;
  const OnInitialize({required this.numInitPokemon});
}

class OnPokemonTap extends PokemonListPageEvent{
  const OnPokemonTap();
}

class OnSearchBarChange extends PokemonListPageEvent{
  final String value;
  const OnSearchBarChange({required this.value});
}

class OnSearchPressed extends PokemonListPageEvent{
  const OnSearchPressed();
}

class OnStopSearchPressed extends PokemonListPageEvent{
  const OnStopSearchPressed();
}

