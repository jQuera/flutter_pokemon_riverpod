import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  //TODO implementar local datasource si quiero almacenar en local la data

  @override
  Future<List<Pokemon>> getList(int limit, int offset) {
    // TODO: implement getList
    throw UnimplementedError();
  }

  @override
  Future<Pokemon> getPokemon(String name) {
    // TODO: implement getPokemon
    throw UnimplementedError();
  }
}
