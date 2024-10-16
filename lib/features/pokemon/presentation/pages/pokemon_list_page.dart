import 'package:flutter/material.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/presentation/pages/pokemon_detail_page.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/presentation/providers/pokemon_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonListPage extends ConsumerWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonListProvider = ref.watch(pokemonListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi PokeApp"),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PokemonDetailPage(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: const BoxDecoration(
                  color: Colors.amber,
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      flex: 1,
                      child: Placeholder(
                        child: SizedBox(
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        color: Colors.red,
                        child: Text("Pokemon Name"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
