import 'package:flutter/material.dart';
import 'package:flutter_pokedex/presenter/details/detail_page.dart';
import 'package:flutter_pokedex/presenter/home/home_page.dart';

import '../../common/repositories/pokemon_repository.dart';

class PokedexRoute extends StatelessWidget {
  const PokedexRoute({super.key, required this.repository});
  final PokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) {
              return const HomePage();
            },
          );
        }

        if (settings.name == '/details') {
          return MaterialPageRoute(
            builder: (context) {
              return const DetailPage(
              );
            },
          );
        }
        return null;
      },
    );
  }
}
