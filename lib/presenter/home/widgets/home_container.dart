
import 'package:flutter/material.dart';

import '../../../common/errors/failure.dart';
import '../../../common/models/pokemon.dart';
import '../../../common/repositories/pokemon_repository.dart';
import '../../../shared/page_error.dart';
import '../../../shared/page_loading.dart';
import '../home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key, required this.repository});
  final IPokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future:repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const PageLoading(
          );
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(list: snapshot.data!
          );
        }
        if (snapshot.hasError) {
          return PageError(error: (snapshot.error as Failure).message!,
          );
        }
        return Container();
      },     
    );
  }
}
