import 'package:flutter_pokemon_riverpod/features/pokemon/data/datasources/local_datasource.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/data/datasources/remote_datasource.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/data/models/pokemon_model.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final RemoteDatasource remoteDatasource;
  final LocalDatasource localDatasource;

  PokemonRepositoryImpl(this.remoteDatasource, this.localDatasource);

  @override
  Future<List<Pokemon>> getList(int limit, int offset) async {
    if (offset < 0) {
      throw Exception("El Offset no puede ser inferior a 0");
    }

    final localCount = await localDatasource.getPokemonLocalCount();
    final maxCount = await localDatasource.getPokemonMaxCount();
    if (maxCount != null && localCount >= maxCount) {
      return await localDatasource.getPokemonList(limit, offset).then(
            (localPokemons) => localPokemons.map((pokemon) => pokemon.toEntity()).toList(),
          );
    }

    final localPokemons = await localDatasource.getPokemonList(limit, offset);

    if (localPokemons.length == limit) {
      return localPokemons.map((PokemonModel model) => model.toEntity()).toList();
    }

    final response = await remoteDatasource.fetchPokemonList(limit, offset + localPokemons.length);
    List<Pokemon> modelToEntityList = [];

    for (PokemonModel pokemon in response) {
      final existingPokemon = await localDatasource.getPokemonByName(pokemon.name);
      if (existingPokemon == null) {
        final detailedPokemon = await remoteDatasource.fetchPokemonDetail(pokemon.name);
        await localDatasource.insertPokemon(detailedPokemon);
        modelToEntityList.add(detailedPokemon.toEntity());
      } else {
        modelToEntityList.add(existingPokemon.toEntity());
      }
    }

    return modelToEntityList;
  }
}
