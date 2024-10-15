import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/domain/repositories/pokemon_repository.dart';

class GetPokemon {
  final PokemonRepository listRepository;

  GetPokemon({required this.listRepository});

  Future<Pokemon> call(String name) {
    return listRepository.getPokemon(name);
  }
}
