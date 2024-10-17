import 'package:flutter/material.dart';
import 'package:flutter_pokemon_riverpod/core/utils/string_utils.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/pokemon.dart';

class PokemonPresentationWidget extends StatelessWidget {
  const PokemonPresentationWidget({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 24;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Text(
            pokemon.name.toTitleCase(),
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Image.network(
            pokemon.imageUrl,
            width: double.infinity,
            fit: BoxFit.contain,
            isAntiAlias: false,
            filterQuality: FilterQuality.none,
          ),
        ],
      ),
    );
  }
}
