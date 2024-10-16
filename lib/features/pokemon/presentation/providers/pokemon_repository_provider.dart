import 'package:flutter_pokemon_riverpod/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/presentation/providers/local_datasource_provider.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/presentation/providers/remote_datasource_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_repository_provider.g.dart';

@riverpod
PokemonRepository pokemonRepository(PokemonRepositoryRef ref) {
  final remoteDatasource = ref.watch(remoteDatasourceProvider);
  final localDatasource = ref.watch(localDatasourceProvider);
  return PokemonRepositoryImpl(remoteDatasource, localDatasource);
}
