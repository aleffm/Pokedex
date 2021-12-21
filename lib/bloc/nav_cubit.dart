import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_details_cubit.dart';

class NavCubit extends Cubit<String> {
  PokemonDetailsCubit pokemonDetailsCubit;

  NavCubit({@required this.pokemonDetailsCubit}) : super(null);

  void showPokemonDetails(String pokemonId) {
    print(pokemonId);
    pokemonDetailsCubit.getPokemonDetails(pokemonId);
    if(pokemonId!=null){emit(pokemonId);}

  }

  void popToPokedex() {
    emit(null);
    pokemonDetailsCubit.clearPokemonDetails();
  }
}
