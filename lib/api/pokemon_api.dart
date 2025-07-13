import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonApi {
  List<dynamic> pokemonList = [];
  Map<String, dynamic> pokemonDetails = {};

  Future<void> fetchPokemonList() async {
    final result = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=30'),
    );
    final data = jsonDecode(result.body);
    return pokemonList = data['results'];
  }

  Future<void> fetchPokemonDetails(String pokemonId) async {
    final result = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemonId'),
    );
    final data = jsonDecode(result.body);
    return pokemonDetails = data;
  }

  String getIdFromUrl(String url) {
    final uri = Uri.parse(url);
    return uri.pathSegments[uri.pathSegments.length - 2];
  }
}

final pokemonApi = PokemonApi();
