import 'package:base_architecture/data/network_manager.dart';
import 'package:base_app/example/data/datasources/remote/pokemon/mapper/pokemon_mapper.dart';
import 'package:base_app/example/data/datasources/remote/pokemon/mapper/pokemon_mapper_impl.dart';
import 'package:base_app/example/data/datasources/remote/pokemon/pokemon_data_source.dart';
import 'package:base_app/example/data/datasources/remote/pokemon/pokemon_data_source_impl.dart';
import 'package:base_app/example/data/repositories/pokemon_repository_impl.dart';
import 'package:base_app/example/domain/repositories/pokemon_repository.dart';
import 'package:base_app/example/lib/di/service_locator.dart';
import 'package:dio/dio.dart';

interface class DataService{

   static void inject(){
    InjectionService.locator
      .registerFactory<PokemonRepository>(() => PokemonRepositoryImpl());
      
    InjectionService.locator
      .registerLazySingleton<PokemonDataSource>(() => PokemonDataSourceImpl());

    InjectionService.locator
      .registerLazySingleton<PokemonMapper>(() => PokemonMapperImpl());

    InjectionService.locator
      .registerLazySingleton<NetworkManager>(() => NetworkManager(dio: Dio()));
  }

  static PokemonRepository get pokemonRepository {
    return InjectionService.locator<PokemonRepository>();
  }

  static NetworkManager get networkManager {
    return InjectionService.locator<NetworkManager>();
  }

  static PokemonMapper get pokemonMapper {
    return InjectionService.locator<PokemonMapper>();
  }

  static PokemonDataSource get pokemonDataSource {
    return InjectionService.locator<PokemonDataSource>();
  }

}