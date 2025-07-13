import 'package:flutter/material.dart';
import 'package:flutter_portfolio/api/pokemon_api.dart';
import 'package:flutter_portfolio/functions/string.dart';
import 'package:flutter_portfolio/views/components/logo.dart';
import 'package:flutter_portfolio/views/pages/pokemon_details.dart';

class Pokemon extends StatefulWidget {
  const Pokemon({super.key});

  @override
  State<Pokemon> createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {
  final ScrollController scrollController = ScrollController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    pokemonApi.fetchPokemonList().then((_) {
      setState(() {
        isLoading = false;
      });
    });
    scrollController.addListener(onScroll);
  }

  void onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      pokemonApi.fetchPokemonList().then((_) => setState(() {}));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Logo(title: "POKEMON")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Pokedex",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Rowdies",
                    ),
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: pokemonApi.pokemonList.length + 1,
                    itemBuilder: (context, index) {
                      if (index < pokemonApi.pokemonList.length) {
                        final pokemon = pokemonApi.pokemonList[index];
                        final id = pokemonApi.getIdFromUrl(pokemon['url']);
                        final imageUrl =
                            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PokemonDetails(
                                  pokemonId: id,
                                  imageUrl: imageUrl,
                                ),
                              ),
                            );
                          },
                          child: Card(
                            margin: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            child: ListTile(
                              title: Text(
                                stringClass.toCapitalize(pokemon['name']),
                              ),
                              trailing: Image.network(imageUrl),
                            ),
                          ),
                        );
                      } else {
                        return const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
