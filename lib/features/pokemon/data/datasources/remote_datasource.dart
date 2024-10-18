import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_pokemon_riverpod/core/constants/constants.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/data/models/pokemon_model.dart';

/// Clase que tiene las funciones que interactuan con la pokeapi
class RemoteDatasource {
  /// Hacemos una consulta a la pokeapi para que devuelva una lista de pokemones basados e un limit y un offset
  Future<List<PokemonModel>> fetchPokemonList(int limit, int offset) async {
    final response = await http.get(Uri.parse('$pokeAPIBaseURL/pokemon?limit=$limit&offset=$offset'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((pokemon) => PokemonModel.fromExternalApi(pokemon)).toList();
    } else {
      throw Exception('Failed to load Pokemon list');
    }
  }

  /// Obtener los datos de un pokemon desde la pokeapi
  Future<PokemonModel> fetchPokemonDetail(String name) async {
    final response = await http.get(Uri.parse('$pokeAPIBaseURL/pokemon/$name'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return PokemonModel.fromExternalApi(data);
    } else {
      throw Exception('Failed to load Pokemon details');
    }
  }
}
