import 'package:flutter_pokemon_riverpod/features/pokemon/data/datasources/local_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_datasource_provider.g.dart';

@riverpod
LocalDatasource localDatasource(LocalDatasourceRef ref) {
  return LocalDatasource();
}
