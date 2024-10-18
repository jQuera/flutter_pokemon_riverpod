import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/stat.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/presentation/widgets/data_detail_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('DataDetailWidget muestra la información del Pokémon', (WidgetTester tester) async {
    final pokemon = Pokemon(
      id: 1,
      name: 'Pikachu',
      imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/25.png',
      type: [],
      height: '0.4 m',
      weight: '6.0 kg',
      habilities: ['Static', 'Lightning Rod'],
      initialStats: [
        Stat(name: 'HP', baseValue: 45),
        Stat(name: 'Attack', baseValue: 49),
      ],
    );

    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: DataDetailWidget(pokemon: pokemon))),
    );

    expect(find.text('HP: 45'), findsOneWidget);
    expect(find.text('Attack: 49'), findsOneWidget);
  });
}
