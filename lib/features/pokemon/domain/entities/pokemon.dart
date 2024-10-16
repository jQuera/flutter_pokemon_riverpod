import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/stat.dart';

class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> type;
  final String height;
  final String weight;
  final List<String> habilities;
  final List<Stat> initialStats;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.type,
    required this.height,
    required this.weight,
    required this.habilities,
    required this.initialStats,
  });
}
