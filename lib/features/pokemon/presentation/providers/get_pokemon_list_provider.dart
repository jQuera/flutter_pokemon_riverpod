import 'package:flutter_pokemon_riverpod/features/pokemon/domain/usecases/get_list.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/presentation/providers/pokemon_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_pokemon_list_provider.g.dart';

@riverpod
GetList getList(GetListRef ref) {
  final repository = ref.watch(pokemonRepositoryProvider);
  return GetList(listRepository: repository);
}
