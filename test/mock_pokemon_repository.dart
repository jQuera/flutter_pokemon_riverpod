// Mock del repositorio
import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/stat.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/domain/repositories/pokemon_repository.dart';

class MockPokemonRepository implements PokemonRepository {
  @override
  Future<List<Pokemon>> getList(int limit, int offset) async {
    return [
      Pokemon(
        id: 1,
        name: 'Bulbasaur',
        imageUrl: 'url',
        type: ['Grass'],
        height: '7',
        weight: '69',
        habilities: ['overgrow'],
        initialStats: [
          Stat(name: 'HP', baseValue: 45),
          Stat(name: 'Attack', baseValue: 49),
          Stat(name: 'Defense', baseValue: 49),
        ],
      ),
    ];
  }
}
