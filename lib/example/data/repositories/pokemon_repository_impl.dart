import 'package:base_app/base/domain/result.dart';
import 'package:base_app/example/data/datasources/remote/pokemon/pokemon_data_source.dart';
import 'package:base_app/example/domain/model/pokemon_model.dart';
import 'package:base_app/example/domain/repositories/pokemon_repository.dart';
import 'package:base_app/example/lib/di/data_service_locator/data_soruce_locator.dart';

class PokemonRepositoryImpl implements PokemonRepository{

  final PokemonDataSource _dataSource = DataService.pokemonDataSource;


  @override
  Future<Result<List<Pokemon>>> getListPokemon(int offset, int limit) {
    return _dataSource.getPokemons();
  }

}