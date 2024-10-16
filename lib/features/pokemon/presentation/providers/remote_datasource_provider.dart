import 'package:flutter_pokemon_riverpod/features/pokemon/data/datasources/remote_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_datasource_provider.g.dart';

@riverpod
RemoteDatasource remoteDatasource(RemoteDatasourceRef ref) {
  return RemoteDatasource();
}
