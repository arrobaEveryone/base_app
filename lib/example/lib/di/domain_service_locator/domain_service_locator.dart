import 'package:base_app/example/domain/usecases/get_list_pokemon_usecase.dart';
import 'package:base_app/example/lib/di/service_locator.dart';
import 'package:get_it/get_it.dart';

interface class DomainService{

  static final locator = GetIt.I;


  static void inject(){
    InjectionService.locator
      .registerFactory<GetListPokemonUseCase>(() => GetListPokemonUseCase());
  }

  static GetListPokemonUseCase get getListPokemonUseCase {
    return InjectionService.locator<GetListPokemonUseCase>();
  }

}