import 'package:flutter/material.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/presentation/widgets/data_detail_widget.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/presentation/widgets/pokemon_presentation_widget.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: const Text(
          'INFO.',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PokemonPresentationWidget(pokemon: pokemon),
            DataDetailWidget(pokemon: pokemon),
          ],
        ),
      ),
    );
  }
}
