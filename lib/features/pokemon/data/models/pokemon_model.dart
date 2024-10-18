import 'package:flutter_pokemon_riverpod/features/pokemon/data/models/stat_model.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/pokemon.dart';

/// Model de pokemon
class PokemonModel {
  int? id;
  String name;
  String? imageUrl;
  List<String>? type;
  String? height;
  String? weight;
  List<String>? habilities;
  List<StatModel>? initialStats;

  PokemonModel({
    this.id,
    required this.name,
    this.imageUrl,
    this.type,
    this.height,
    this.weight,
    this.habilities,
    this.initialStats,
  });

  /// Convertir desde pokeapi, permite que falten datos
  factory PokemonModel.fromExternalApi(Map<String, dynamic> json) => PokemonModel(
        id: json['id'],
        name: json['name'],
        imageUrl: json['sprites'] != null ? json['sprites']['front_default'] : null,
        type: json['types'] != null ? List<String>.from(json['types'].map((type) => type['type']['name'])) : [],
        height: json['height']?.toString(),
        weight: json['weight']?.toString(),
        habilities: json['abilities'] != null
            ? List<String>.from(json['abilities'].map((ability) => ability['ability']['name']))
            : [],
        initialStats:
            json['stats'] != null ? List<StatModel>.from(json['stats'].map((stat) => StatModel.fromJson(stat))) : [],
      );

  /// Convertir desde SQLite a PokemonModel
  factory PokemonModel.fromSQLite(Map<String, dynamic> map) {
    return PokemonModel(
      id: map['id'],
      name: map['name'],
      imageUrl: map['imageUrl'],
      type: map['type'].split(','),
      height: map['height'],
      weight: map['weight'],
      habilities: map['habilities'].split(','),
      initialStats: List<StatModel>.from(
        map['initialStats'].split(',').map((stat) {
          final statData = stat.split(':');
          return StatModel(name: statData[0], baseValue: int.parse(statData[1]));
        }),
      ),
    );
  }

  /// Convertir a Map para guardar en SQLite
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'type': type?.join(',') ?? '',
      'height': height,
      'weight': weight,
      'habilities': habilities?.join(',') ?? '',
      'initialStats': initialStats?.map((stat) => '${stat.name}:${stat.baseValue}').join(',') ?? '',
    };
  }

  ///  Convertir desde el entity a PokemonModel
  factory PokemonModel.fromEntity(Pokemon pokemon) => PokemonModel(
        id: pokemon.id,
        name: pokemon.name,
        imageUrl: pokemon.imageUrl,
        type: pokemon.type,
        height: pokemon.height,
        weight: pokemon.weight,
        habilities: pokemon.habilities,
        initialStats:
            pokemon.initialStats.map((stat) => StatModel(name: stat.name, baseValue: stat.baseValue)).toList(),
      );

  /// Convertir al entity
  Pokemon toEntity() => Pokemon(
        id: id ?? 0,
        name: name,
        imageUrl: imageUrl ?? '',
        type: type ?? [],
        height: height ?? '',
        weight: weight ?? '',
        habilities: habilities ?? [],
        initialStats: initialStats?.map((stat) => stat.toEntity()).toList() ?? [],
      );
}
