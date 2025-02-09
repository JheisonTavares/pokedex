import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/errors/failure.dart';
import 'package:flutter_pokedex/common/repositories/pokemon_repository.dart';

import '../../../common/models/pokemon.dart';
import '../screens/home_error.dart';
import '../screens/home_loading.dart';
import '../screens/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key, required this.repository});
  final IPokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future:repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const HomeLoading(
          );
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(list: snapshot.data!
          );
        }
        if (snapshot.hasError) {
          return HomeError(error: (snapshot.error as Failure).message!,
          );
        }
        return Container();
      },     
    );
  }
}
