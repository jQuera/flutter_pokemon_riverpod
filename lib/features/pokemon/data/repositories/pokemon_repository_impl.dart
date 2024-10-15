import 'package:flutter_pokemon_riverpod/features/pokemon/data/datasources/remote_datasource.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  //TODO implementar local datasource si quiero almacenar en local la data
  final RemoteDatasource remoteDatasource;

  PokemonRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<Pokemon>> getList(int limit, int offset) async {
    final response = await remoteDatasource.fetchPokemonList(limit, offset);
    List<Pokemon> modelToEntityList = response.map((pokemon) => pokemon.toEntity()).toList();
    return modelToEntityList;
  }

  @override
  Future<Pokemon> getPokemon(String name) async {
    final response = await remoteDatasource.fetchPokemonDetail(name);
    Pokemon modelToEntity = response.toEntity();
    return modelToEntity;
  }
}
