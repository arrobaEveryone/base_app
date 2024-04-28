import 'package:base_app/base/domain/result.dart';
import 'package:base_app/example/domain/model/pokemon_model.dart';

abstract class PokemonDataSource{

   Future<Result<List<Pokemon>>> getPokemons();

}