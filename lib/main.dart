import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'common/repositories/pokemon_repository.dart';
import 'features/pokedex/pokedex_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex ',
        theme: ThemeData(
         primarySwatch: Colors.yellow,
        ),
        home: PokedexRoute(
          repository: PokemonRepository(
            dio: Dio(),
          ), 
        )

        /*HomeContainer(
        repository: PokemonRepository(
          dio: Dio(),
        ),
      ),*/
        );
  }
}
