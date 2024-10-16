import 'package:flutter_pokemon_riverpod/features/pokemon/domain/usecases/get_pokemon.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/presentation/providers/pokemon_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_pokemon_provider.g.dart';

@riverpod
GetPokemon getPokemon(GetPokemonRef ref) {
  final repository = ref.watch(pokemonRepositoryProvider);
  return GetPokemon(listRepository: repository);
}
