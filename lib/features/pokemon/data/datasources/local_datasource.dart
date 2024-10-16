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

        await db.execute('''
          CREATE TABLE pokemon_count (
          id INTEGER PRIMARY KEY,
          count INTEGER
          );
      ''');
      },
    );
  }

  Future<void> insertPokemonCount(int count) async {
    final db = await database;
    await db.insert(
      'pokemon_count',
      {'id': 1, 'count': count},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int?> getPokemonMaxCount() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('pokemon_count');
    if (maps.isEmpty) return null;
    return maps.first['count'] as int;
  }

  Future<int> getPokemonLocalCount() async {
    final db = await database;
    final count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM pokemons'));
    return count ?? 0;
  }

  Future<List<PokemonModel>> getAllPokemonList() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('pokemons');
    return List.generate(maps.length, (i) {
      return PokemonModel.fromSQLite(maps[i]);
    });
  }

  Future<List<PokemonModel>> getPokemonList(int limit, int offset) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'pokemons',
      limit: limit,
      offset: offset,
    );
    return List.generate(maps.length, (i) {
      return PokemonModel.fromSQLite(maps[i]);
    });
  }

  Future<PokemonModel?> getPokemonByName(String name) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'pokemons',
      where: 'name = ?',
      whereArgs: [name],
    );
    if (maps.isEmpty) return null;
    return PokemonModel.fromSQLite(maps.first);
  }

  Future<void> insertPokemon(PokemonModel pokemon) async {
    final db = await database;
    await db.insert('pokemons', pokemon.toJson());
  }

  Future<void> updatePokemon(PokemonModel pokemon) async {
    final db = await database;
    await db.update(
      'pokemons',
      pokemon.toJson(),
      where: 'id = ?',
      whereArgs: [pokemon.id],
    );
  }
}
