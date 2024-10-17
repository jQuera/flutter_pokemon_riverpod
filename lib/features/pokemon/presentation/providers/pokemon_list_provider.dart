import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/presentation/providers/get_pokemon_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_list_provider.g.dart';

@riverpod
class PokemonList extends _$PokemonList {
  bool _isLoading = false;
  String error = '';
  @override
  List<Pokemon> build() {
    fetchPokemonList(20, 0);
    return [];
  }

  Future<void> fetchPokemonList(int limit, int offset) async {
    if (_isLoading) return;
    _isLoading = true;
    try {
      final getList = ref.read(getListProvider);
      final pokemonList = await getList(limit, offset);
      state = [...state, ...pokemonList];
    } catch (e) {
      error = e.toString();
    } finally {
      _isLoading = false;
    }
  }
}
