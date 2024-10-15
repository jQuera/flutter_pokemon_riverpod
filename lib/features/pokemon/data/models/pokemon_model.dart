import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/pokemon.dart';

class PokemonModel {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> type;
  final String height;
  final String weight;
  final List<String> habilities;
  final List<String> initialStats;

  PokemonModel(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.type,
      required this.height,
      required this.weight,
      required this.habilities,
      required this.initialStats});

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        id: json['id'],
        name: json['name'],
        imageUrl: json['sprites']['front_default'],
        type: List<String>.from(json['types'].map((type) => type['type']['name'])),
        height: json['height'].toString(),
        weight: json['weight'].toString(),
        habilities: List<String>.from(json['abilities'].map((ability) => ability['ability']['name'])),
        initialStats: List<String>.from(json['stats'].map((stat) => stat['stat']['name'])),
      );

  factory PokemonModel.fromEntity(Pokemon pokemon) => PokemonModel(
        id: pokemon.id,
        name: pokemon.name,
        imageUrl: pokemon.imageUrl,
        type: pokemon.type,
        height: pokemon.height,
        weight: pokemon.weight,
        habilities: pokemon.habilities,
        initialStats: pokemon.initialStats,
      );

  Pokemon toEntity() => Pokemon(
      id: id,
      name: name,
      imageUrl: imageUrl,
      type: type,
      height: height,
      weight: weight,
      habilities: habilities,
      initialStats: initialStats);
}
