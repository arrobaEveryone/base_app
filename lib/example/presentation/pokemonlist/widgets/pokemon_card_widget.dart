
import 'package:base_app/components/gap.dart';
import 'package:base_app/components/utils/colors_extension.dart';
import 'package:base_app/example/domain/model/pokemon_model.dart';
import 'package:base_app/example/domain/model/pokemon_type.dart';
import 'package:base_app/example/presentation/pokemonlist/widgets/pokemon_card_type_widget.dart';
import 'package:base_app/example/common/utils/pokemon_extension.dart';
import 'package:base_app/example/common/utils/pokemon_type_extension.dart';
import 'package:base_app/example/common/utils/triangle_painter.dart';
import 'package:base_app/example/common/utils/rounded_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PokemonCardWidget extends StatelessWidget {

  final Pokemon pokemon;

  const PokemonCardWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Ajusta el radio según sea necesario
      ),
      child: Stack(
        children: [
         _buildCardContent(pokemon),
          Positioned(
            bottom: 0,
            right: 0,
            child:  _buildTriangleAndPokeball(pokemon.type.first),
          ),
        ],
      )
    );
  }

  Widget _buildCardContent(Pokemon pokemon){
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildImage(pokemon.imageUrl),
            const Gap(10),
            _buildNameAndTypes(pokemon),
            
          ],
        ),
      );
  }

  Widget _buildTriangleAndPokeball(PokemonType type) {
    return SizedBox(
      width: 140,
      height: 120,
      child: 
      ClipPath(
        clipper: RoundedClipper(borderRadius: BorderRadius.circular(15.0), clipTopRight: true, clipBottomRight: true),
        child: Stack(
          children: [
            CustomPaint(
              size: const Size(150, 150),
              painter: TrianglePainter(type.getTypeColor(),),
            ),
            Positioned(
              bottom: 4,
              right: 4,
              child: Image.network(
                'https://cdn.icon-icons.com/icons2/2603/PNG/512/poke_ball_icon_155925.png',
                width: 50,
                height: 50, 
                color: type.getTypeColor().colorOnBackground(),
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget _buildNameAndTypes(Pokemon pokemon) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNameAndId(pokemon),
            const Gap(8),
          _buildTypes(pokemon.type, !pokemon.isMonotype())
        ],
      ),
    );
  }

  Widget _buildTypes(List<PokemonType> type, bool isMonotype) {
    return Row(
      children: [
        PokemonTypeCard(type: pokemon.type.first),
        if(isMonotype)...[
          PokemonTypeCard(type: pokemon.type.last),
        ]
       
      ],
    );
  }
  
  Widget _buildNameAndId(Pokemon pokemon) {
    return Row(
      children: [
        Text(
          pokemon.id,
          style: const TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold
          ),
        ),
        const Gap(8),
        Text(
          pokemon.name,
          style: const TextStyle(
            fontSize: 24, // Tamaño de fuente aumentado
          ),
        )
      ],
    );
  }

  Widget _buildImage(String imageUrl) {
    return SizedBox(
      width: 100, // Tamaño fijo para todas las imágenes
      height: 100, // Tamaño fijo para todas las imágenes
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
}

}




