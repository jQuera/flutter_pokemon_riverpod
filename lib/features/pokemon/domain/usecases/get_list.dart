import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/domain/repositories/pokemon_repository.dart';

/// Clase que implementa el GetList de PokemonRepository
class GetList {
  final PokemonRepository listRepository;

  GetList({required this.listRepository});

  Future<List<Pokemon>> call(int limit, int offset) {
    return listRepository.getList(limit, offset);
  }
}
