import 'package:base_app/example/domain/model/pokemon_type.dart';
import 'package:flutter/material.dart';

extension PokemonTypeExtensions on PokemonType {

  Color getTypeColor(){
      switch (this) {
        case PokemonType.normal:
          return Colors.grey;
        case PokemonType.fire:
          return Colors.red;
        case PokemonType.water:
          return Colors.blue;
        case PokemonType.electric:
          return Colors.yellow;
        case PokemonType.grass:
          return Colors.green;
        case PokemonType.ice:
          return Colors.lightBlueAccent;
        case PokemonType.fighting:
          return Colors.orange;
        case PokemonType.poison:
          return Colors.purple;
        case PokemonType.ground:
          return Colors.brown;
        case PokemonType.flying:
          return Colors.cyan;
        case PokemonType.psychic:
          return Colors.pink;
        case PokemonType.bug:
          return Colors.lightGreen;
        case PokemonType.rock:
          return Colors.brown;
        case PokemonType.ghost:
          return Colors.purpleAccent;
        case PokemonType.dragon:
          return Colors.indigo;
        case PokemonType.dark:
          return Colors.brown;
        case PokemonType.steel:
          return Colors.grey;
        case PokemonType.fairy:
          return Colors.pinkAccent;
        default:
          return Colors.black;
      }
    }
}