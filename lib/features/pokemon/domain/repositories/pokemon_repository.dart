import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getList(int limit, int offset);

  Future<Pokemon> getPokemon(String name);
}
