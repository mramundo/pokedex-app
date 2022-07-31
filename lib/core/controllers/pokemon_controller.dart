import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/core/models/pokemon.dart';

class PokemonController extends GetxController {
  final pokemonList = [].obs;

  @override
  void onReady() {
    getPokemons();
    super.onReady();
  }

  Future<void> getPokemons() async {
    String pokedex = await rootBundle.loadString('assets/json/pokedex.json');
    List<dynamic> pokemons = json.decode(pokedex)['pokemon'];

    pokemonList
        .assignAll(pokemons.map((model) => Pokemon.fromJson(model)).toList());
  }
}
