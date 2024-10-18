import 'package:flutter_pokemon_riverpod/core/constants/constants.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/data/datasources/local_datasource.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/data/datasources/remote_datasource.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/data/models/pokemon_model.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/domain/repositories/pokemon_repository.dart';

/// Implementacion del repo abstracto de pokemon
class PokemonRepositoryImpl implements PokemonRepository {
  final RemoteDatasource remoteDatasource;
  final LocalDatasource localDatasource;

  PokemonRepositoryImpl(this.remoteDatasource, this.localDatasource);

  ///Funcion que obtiene una lista de pokemones de forma local primero y luego en la remota
  @override
  Future<List<Pokemon>> getList(int limit, int offset) async {
    /// Valida el offset y el limite para que esten en rangos validos
    if (offset < 0) {
      throw ArgumentError("El Offset no puede ser inferior a 0");
    }
    if (limit < 0) {
      throw ArgumentError("El Limite no puede ser inferior a 0");
    }

    /// Verifica si el offset es mayor o igual al maximo de pokemones existentes
    if (offset >= pokemonMaxCount) {
      return [];
    }

    final localCount = await localDatasource.getPokemonLocalCount();

    /// Si la lista local es mayor al offset + limite
    /// le devolvemos toda la lista previamente guardada en local
    if (localCount >= offset + limit) {
      return await localDatasource.getPokemonList(localCount, 0).then(
            (localPokemons) => localPokemons.map((pokemon) => pokemon.toEntity()).toList(),
          );
    }

    /// Se obtiene la lista de pokemones a la pokeapi
    final response = await remoteDatasource.fetchPokemonList(limit, offset + localCount);
    List<Pokemon> modelToEntityList = [];

    /// Procesamos cada pokemon y validamos que no exista en la db local para guardarlo
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
