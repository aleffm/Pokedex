import '../pokemon_page_response.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState{}

class PokemonLoadInProgress extends PokemonState{}

class PokemonPageLoadSucess extends PokemonState{
  final List<PokemonListing> pokemonListings;
  final bool canLoadNextPage;

  PokemonPageLoadSucess({
    required this.pokemonListings,
    required this.canLoadNextPage
  });

}

class PokemonPageLoadFailed extends PokemonState{
  final Object error;

  PokemonPageLoadFailed({
  required this.error
  });
}
