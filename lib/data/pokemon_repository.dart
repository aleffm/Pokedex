import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/data/pokemon_info_response.dart';
import 'package:pokedex/data/pokemon_species_info.dart';

class PokemonRepository {
  final baseUrl = 'pokeapi.co';
  final client = http.Client();


  Future<PokemonInfoResponse> getPokemonInfo(String pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon/'+pokemonId);

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return PokemonInfoResponse.fromJson(json);
    } catch (e) {
      PokemonInfoResponse.error(e);
    }
  }

  Future<PokemonSpeciesInfoResponse> getPokemonSpeciesInfo(
      String pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon-species/'+pokemonId);

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return PokemonSpeciesInfoResponse.fromJson(json);
    } catch (e) {
      PokemonSpeciesInfoResponse.error(e);
    }
  }
}
