import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/stat.dart';

class StatModel {
  final String name;
  final int baseValue;

  StatModel({
    required this.name,
    required this.baseValue,
  });

  // Convertir desde JSON
  factory StatModel.fromJson(Map<String, dynamic> json) => StatModel(
        name: json['stat']['name'],
        baseValue: json['base_stat'],
      );

  // Convertir a JSON
  Map<String, dynamic> toJson() => {
        'name': name,
        'baseValue': baseValue,
      };

  // Convertir a un string
  String toSqliteString() {
    return '$name:$baseValue';
  }

  Stat toEntity() => Stat(
        name: name,
        baseValue: baseValue,
      );
}
