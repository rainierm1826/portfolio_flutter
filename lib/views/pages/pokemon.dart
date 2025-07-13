import 'package:flutter/material.dart';
import 'package:flutter_portfolio/api/pokemon_api.dart';
import 'package:flutter_portfolio/functions/string.dart';
import 'package:flutter_portfolio/views/components/logo.dart';
import 'package:flutter_portfolio/views/components/theme_button.dart';
import 'package:flutter_portfolio/views/pages/pokemon_details.dart';

class Pokemon extends StatefulWidget {
  const Pokemon({super.key});

  @override
  State<Pokemon> createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Logo(title: "POKEMON"),
        actions: [ThemeButton()],
      ),
      body: FutureBuilder(
        future: pokemonApi.fetchPokemonList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return (Center(child: CircularProgressIndicator()));
          }
          final pokemonList = pokemonApi.pokemonList;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Center(
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
                  itemCount: pokemonList.length,
                  itemBuilder: (context, index) {
                    final id = pokemonApi.getIdFromUrl(
                      pokemonList[index]['url'],
                    );
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
                            stringClass.toCapitalize(
                              pokemonList[index]['name'],
                            ),
                          ),
                          trailing: Image.network(imageUrl),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
