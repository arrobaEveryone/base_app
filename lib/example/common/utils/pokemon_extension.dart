import 'package:base_app/example/domain/model/pokemon_model.dart';

extension PokemonExtension on Pokemon{

  bool isMonotype(){
    return type.first == type.last;
  }
}