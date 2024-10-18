import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/pokemon.dart';

///Clase abstracta del PokemonRepository con sus funciones
abstract class PokemonRepository {
  Future<List<Pokemon>> getList(int limit, int offset);
}
