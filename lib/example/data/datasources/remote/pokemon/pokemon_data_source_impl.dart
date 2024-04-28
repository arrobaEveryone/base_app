import 'package:base_app/architecture/data/network_manager.dart';
import 'package:base_app/architecture/domain/result.dart';
import 'package:base_app/example/data/datasources/remote/pokemon/mapper/pokemon_mapper.dart';
import 'package:base_app/example/data/datasources/remote/pokemon/pokemon_data_source.dart';
import 'package:base_app/example/domain/model/pokemon_model.dart';
import 'package:base_app/example/lib/di/data_service_locator/data_soruce_locator.dart';

class PokemonDataSourceImpl implements PokemonDataSource{

  final PokemonMapper mapper = DataService.pokemonMapper;
  final NetworkManager _networkManager = DataService.networkManager; 

  final String url = 'http://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json';

  @override
  Future<Result<List<Pokemon>>> getPokemons() async{
    
    try {
      final response = await _networkManager.request(RequestMethod.get, url);
      if(response.statusCode == 200) {
        List<Pokemon> data = mapper.toModel(response.data);
        return Success(data: data);
      } else {
        return Error(error: Exception(response.statusMessage));
      }
    } on Exception catch(exception) {
      return Error(error: exception);
    }
  }

}