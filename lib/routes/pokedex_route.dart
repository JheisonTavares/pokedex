import 'package:flutter/material.dart';
import 'package:flutter_pokedex/presenter/details/pages/detail_page.dart';

import '../common/models/pokemon.dart';
import '../common/repositories/pokemon_repository.dart';
import '../presenter/home/widgets/home_container.dart';

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
            return HomeContainer(repository: repository);
          },
        );
     }
        
          if (settings.name == '/details') {
          return MaterialPageRoute(
            builder: (context) {
              return DetailPage(
                pokemon: settings.arguments as Pokemon,);
            },
          );
        }
          return null;
      },
    );
  }
}
