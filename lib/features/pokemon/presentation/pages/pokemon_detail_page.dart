import 'package:flutter/material.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/pokemon.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("Nombre de pokemon"),
            const SizedBox(height: 12),
            Placeholder(
              fallbackHeight: MediaQuery.sizeOf(context).width,
              fallbackWidth: MediaQuery.sizeOf(context).width,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tipo:"),
                Text("Tierra/Dragon"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Altura:"),
                Text("1.80m"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Habilidades:"),
                Text("ataque1, ataque2, ataque3, ataque4"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Estadisticas base:"),
                Text("stats"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
