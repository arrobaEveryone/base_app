import 'package:base_app/base/domain/result.dart';
import 'package:base_app/example/domain/model/pokemon_model.dart';

abstract class PokemonRepository{

  Future<Result<List<Pokemon>>> getListPokemon(int offset, int limit);

}