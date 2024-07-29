import 'package:flutter/material.dart';
import 'package:flutter_pokedex/features/pokedex/screens/details/pages/detail_page.dart';
import 'package:flutter_pokedex/features/pokedex/screens/home/home_page.dart';

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
                list: [],
              );
            },
          );
        }
        return null;
      },
    );
  }
}