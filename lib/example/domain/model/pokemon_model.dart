import 'package:base_app/architecture/domain/model/base_model.dart';
import 'package:base_app/example/domain/model/pokemon_type.dart';

class Pokemon extends BaseModel{
  final String id;
  final String name;
  final String imageUrl;
  final List<PokemonType> type;

  Pokemon({required this.id, required this.name, required this.imageUrl, required this.type});
  
  @override
  List<Object?> get props => [
    id, name, imageUrl, type
  ];
}