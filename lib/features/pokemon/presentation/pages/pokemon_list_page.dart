import 'package:flutter/material.dart';
import 'package:flutter_pokemon_riverpod/core/utils/string_utils.dart';
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
        title: const Text(
          "Mi PokeApp",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: pokemonListNotifier.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                    final provider = ref.read(pokemonListProvider.notifier);
                    provider.fetchPokemonList(20, pokemonListNotifier.length);
                  }
                  return true;
                },
                child: ListView.separated(
                  padding: EdgeInsets.only(top: 24, bottom: 32 + MediaQuery.paddingOf(context).bottom),
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
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.amber.withOpacity(0.2),
                                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                border: Border.all(color: Colors.amber),
                              ),
                              height: 100,
                              width: 100,
                              child: Image.network(
                                pokemon.imageUrl,
                                cacheHeight: 100,
                                cacheWidth: 100,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color.lerp(Colors.amber, Colors.white, 0.8),
                                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                    border: Border.all(color: Colors.amber, width: 4),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                  child: Text(
                                    '${pokemon.id}- ${pokemon.name.toTitleCase()}',
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
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
