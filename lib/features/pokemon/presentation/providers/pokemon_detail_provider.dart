import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/presentation/providers/get_pokemon_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_detail_provider.g.dart';

@riverpod
class PokemonDetail extends _$PokemonDetail {
  @override
  Pokemon? build() {
    return null;
  }

  Future<void> fetchPokemon(String name) async {
    final getPokemon = ref.read(getPokemonProvider);
    state = await getPokemon(name);
  }
}
