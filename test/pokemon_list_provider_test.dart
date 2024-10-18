import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/presentation/providers/get_pokemon_list_provider.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/presentation/providers/pokemon_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock_pokemon_repository.dart';

void main() {
  test('getListProvider fetch list of Pokemon', () async {
    final container = ProviderContainer(overrides: [
      pokemonRepositoryProvider.overrideWithValue(MockPokemonRepository()),
    ]);

    addTearDown(container.dispose);

    final getList = container.read(getListProvider);
    final pokemonList = await getList.call(20, 0);

    expect(pokemonList, isA<List<Pokemon>>());
    expect(pokemonList.isNotEmpty, true);

    expect(pokemonList[0].initialStats, isNotEmpty);
    expect(pokemonList[0].initialStats[0].name, 'HP');
  });
}
