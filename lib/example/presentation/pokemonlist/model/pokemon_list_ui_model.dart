import 'package:base_app/base/domain/model/base_model.dart';
import 'package:base_app/example/domain/model/pokemon_model.dart';

class PokemonListUIModel extends BaseModel {
  final List<Pokemon> completePokemonList;
  final List<Pokemon> pokemonList;
  final bool isSearching;

  PokemonListUIModel({this.completePokemonList = const [], this.pokemonList = const [], this.isSearching = false});

  PokemonListUIModel copyWith({
    List<Pokemon>? completePokemonList,
    List<Pokemon>? pokemonList,
    bool? isSearching
  }){
    return PokemonListUIModel(
      completePokemonList: completePokemonList?? this.completePokemonList,
      pokemonList: pokemonList ?? this.pokemonList,
      isSearching: isSearching?? this.isSearching
    );
  }

  @override
  List<Object?> get props => [completePokemonList,pokemonList,isSearching];
  
}
