import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonApi {
  List<dynamic> pokemonList = [];
  Map<String, dynamic> pokemonDetails = {};
  int offset = 0;
  final int limit = 30;

  // fetch pokemon list
  Future<void> fetchPokemonList() async {
    final result = await http.get(
      Uri.parse(
        'https://pokeapi.co/api/v2/pokemon?offset=$offset&limit=$limit',
      ),
    );
    final data = jsonDecode(result.body);
    pokemonList.addAll(data['results']);
    offset += 15;
  }

  // fetch specific pokemon
  Future<void> fetchPokemonDetails(String pokemonId) async {
    final result = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemonId'),
    );
    final data = jsonDecode(result.body);
    pokemonDetails = data;
  }

  // get image url
  String getIdFromUrl(String url) {
    final uri = Uri.parse(url);
    return uri.pathSegments[uri.pathSegments.length - 2];
  }
}

final pokemonApi = PokemonApi();
