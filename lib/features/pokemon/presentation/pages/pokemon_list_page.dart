import 'package:flutter/material.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/presentation/providers/pokemon_list_provider.dart';
import 'package:flutter_pokemon_riverpod/features/pokemon/presentation/widgets/pokemon_card_widget.dart';
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
                    return PokemonCardWidget(pokemon: pokemon);
                  },
                ),
              ),
            ),
    );
  }
}
