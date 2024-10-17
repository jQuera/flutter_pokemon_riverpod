import 'package:flutter/material.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/presentation/pages/pokemon_detail_page.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/presentation/providers/pokemon_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonListPage extends ConsumerWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonListNotifier = ref.watch(pokemonListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi PokeApp"),
      ),
      body: pokemonListNotifier.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                    print("entro");
                    final provider = ref.read(pokemonListProvider.notifier);
                    provider.fetchPokemonList(20, pokemonListNotifier.length);
                  }
                  return true;
                },
                child: ListView.separated(
                  itemCount: pokemonListNotifier.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final pokemon = pokemonListNotifier[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PokemonDetailPage(
                              pokemon: pokemon,
                            ),
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
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                pokemon.imageUrl,
                                cacheHeight: 100,
                                cacheWidth: 100,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 100,
                                color: Colors.red,
                                child: Text(pokemon.name),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
