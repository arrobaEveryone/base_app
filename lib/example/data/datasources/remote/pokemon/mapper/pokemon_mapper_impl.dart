import 'dart:convert';

import 'package:base_app/base/domain/utils/enum_from_string.dart';
import 'package:base_app/example/data/datasources/remote/pokemon/mapper/pokemon_mapper.dart';
import 'package:base_app/example/domain/model/pokemon_model.dart';
import 'package:base_app/example/domain/model/pokemon_type.dart';

class PokemonMapperImpl implements PokemonMapper{

  @override
  List<Pokemon> toModel(String body) {
    return (json.decode(body) as List)
        .map((item) => Pokemon(
          id: item['id'], 
          name: item['name'], 
          imageUrl: item['imageurl'], 
          type: (item['typeofpokemon'] as List).map((e) => 
              enumFromString(e, PokemonType.values, PokemonType.unknown)).toList()
          )
        ).toList();
  }

}