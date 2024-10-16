import 'package:flutter_pokemon_riverpod/features/pokemon/data/models/pokemon_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatasource {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'pokemon.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE pokemons (
            id INTEGER PRIMARY KEY,
            name TEXT,
            imageUrl TEXT,
            type TEXT,
            height TEXT,
            weight TEXT,
            habilities TEXT,
            initialStats TEXT
          )
          ''');
      },
    );
  }

  Future<List<PokemonModel>> getLocalPokemonList() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('pokemons');
    return List.generate(maps.length, (i) {
      return PokemonModel.fromExternalApi(json)
    });
  }
}
