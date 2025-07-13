import 'package:flutter/material.dart';
import 'package:flutter_portfolio/api/pokemon_api.dart';
import 'package:flutter_portfolio/functions/string.dart';
import 'package:flutter_portfolio/views/components/logo.dart';
import 'package:flutter_portfolio/views/components/theme_button.dart';

class PokemonDetails extends StatelessWidget {
  final String pokemonId;
  final String imageUrl;
  const PokemonDetails({
    super.key,
    required this.pokemonId,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Logo(title: "POKEMON DETAILS"),
        actions: [ThemeButton()],
      ),
      body: FutureBuilder(
        future: pokemonApi.fetchPokemonDetails(pokemonId),
        builder: (context, snapshopt) {
          if (snapshopt.connectionState == ConnectionState.waiting) {
            return (Center(child: CircularProgressIndicator()));
          }

          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200.0,
                  child: Image.network(imageUrl, fit: BoxFit.fill),
                ),
                Text(
                  pokemonApi.pokemonDetails['name'].toUpperCase(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Rowdies',
                  ),
                ),
                const Divider(thickness: 1, indent: 32, endIndent: 32),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Height: ${pokemonApi.pokemonDetails['height']}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Rowdies',
                            ),
                          ),
                          Text(
                            "Weight: ${pokemonApi.pokemonDetails['weight']}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Rowdies',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Type: ${pokemonApi.pokemonDetails['types'].map((t) => stringClass.toCapitalize(t['type']['name'])).join(', ')}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Rowdies',
                            ),
                          ),
                          Text(
                            "Base Exp: ${pokemonApi.pokemonDetails['base_experience']}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Rowdies',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ID: ${pokemonApi.pokemonDetails['id']}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Rowdies',
                            ),
                          ),

                          Text(
                            "Order: ${pokemonApi.pokemonDetails['order']}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Rowdies',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
