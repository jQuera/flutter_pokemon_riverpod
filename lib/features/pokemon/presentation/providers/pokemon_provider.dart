import 'package:flutter_pokemon_riverpod/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/domain/usecases/get_list.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/domain/usecases/get_pokemon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonRepositoryProvider = Provider<PokemonRepository>((ref) {
  final repository = ref.read(pokemonRepositoryProvider);
  return PokemonRepositoryImpl(repository);
});

final getListProvider = Provider<GetList>((ref) {
  final repository = ref.read(pokemonRepositoryProvider);
  return GetList(repository);
});

final getPokemonProvider = Provider<GetPokemon>((ref) {
  final repository = ref.read(pokemonRepositoryProvider);
  return GetPokemon(repository);
});
