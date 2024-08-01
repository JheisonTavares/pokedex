// lib/controllers/pokemon_controller.dart

import '../models/pokemon.dart';
import '../repositories/pokemon_repository.dart';

class PokemonController {
  final IPokemonRepository repository;
  List<Pokemon> pokemons = [];
  

  PokemonController({required this.repository});

  Future<void> fetchPokemons() async {
    pokemons = await repository.getAllPokemons();
  }
}