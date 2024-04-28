import 'package:base_app/components/utils/colors_extension.dart';
import 'package:base_app/components/utils/string_extension.dart';
import 'package:base_app/example/domain/model/pokemon_type.dart';
import 'package:base_app/example/common/utils/pokemon_type_extension.dart';
import 'package:flutter/material.dart';

class PokemonTypeCard extends StatelessWidget {

  final PokemonType type;

  const PokemonTypeCard({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: type.getTypeColor(),
        child: Container(
        constraints: const BoxConstraints(minWidth: 50),
        padding: const EdgeInsets.all(6.0),
        child: Text(
            type.name.capitalize(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: type.getTypeColor().colorOnBackground(),
              fontWeight: FontWeight.bold,
            ),
          ),
        )
    );
  }
}