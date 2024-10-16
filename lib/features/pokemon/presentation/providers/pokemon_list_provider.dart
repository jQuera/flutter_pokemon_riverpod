import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/presentation/providers/get_pokemon_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_list_provider.g.dart';

@riverpod
class PokemonList extends _$PokemonList {
  @override
  List<Pokemon> build() {
    return [];
  }

  Future<void> fetchPokemonList(int limit, int offset) async {
    final getList = ref.read(getListProvider);
    final pokemonList = await getList(limit, offset);
    state = [...state, ...pokemonList];
  }
}
