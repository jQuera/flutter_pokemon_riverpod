import 'package:flutter/material.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/domain/entities/pokemon.dart';

class DataDetailWidget extends StatelessWidget {
  const DataDetailWidget({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        8,
        8,
        8,
        32 + MediaQuery.paddingOf(context).bottom,
      ),
      decoration: const BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Type:"),
              Text(pokemon.type.join('/')),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 1,
            color: Colors.grey.withOpacity(0.2),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Height:"),
              Text(pokemon.height),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 1,
            color: Colors.grey.withOpacity(0.2),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Abilities:"),
              Text(pokemon.habilities.join(', ')),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 1,
            color: Colors.grey.withOpacity(0.2),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Base Stats:"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: pokemon.initialStats.map((stat) => Text('${stat.name}: ${stat.baseValue}')).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
