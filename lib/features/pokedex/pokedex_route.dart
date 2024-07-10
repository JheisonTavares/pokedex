import 'package:flutter/material.dart';

import '../../common/repositories/pokemon_repository.dart';
import 'screens/details/container/detail_container.dart';
import 'screens/home/container/home_container.dart';

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
              return DetailContainer(repository: repository);
            },
          );
        }
          return null;
      },
    );
  }
}
