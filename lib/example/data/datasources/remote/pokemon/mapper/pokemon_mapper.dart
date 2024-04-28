import 'package:base_app/example/domain/model/pokemon_model.dart';

abstract class PokemonMapper{

  List<Pokemon> toModel(String json);

}