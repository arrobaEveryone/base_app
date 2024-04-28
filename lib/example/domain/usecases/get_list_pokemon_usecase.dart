import 'package:base_app/base/domain/base_use_case.dart';
import 'package:base_app/base/domain/result.dart';
import 'package:base_app/example/domain/model/pokemon_model.dart';
import 'package:base_app/example/domain/repositories/pokemon_repository.dart';
import 'package:base_app/example/lib/di/data_service_locator/data_soruce_locator.dart';

class GetListPokemonUseCase extends BaseUseCase<GetPokemonsParams,List<Pokemon>>{
  
  final PokemonRepository _repository = DataService.pokemonRepository;

  @override
  Future<Result<List<Pokemon>>> invoke(GetPokemonsParams params) async {
    return  _repository.getListPokemon(params.page, params.limit);
  }

}

class GetPokemonsParams {
  const GetPokemonsParams({
    required this.page,
    required this.limit,
  });

  final int page;
  final int limit;
}