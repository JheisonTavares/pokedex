import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';

import '../../../../../common/repositories/pokemon_repository.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  late Future<List<Pokemon>> futureName;

  @override
  void initState() {
    super.initState();
    futureName = PokemonRepository(dio: Dio()).getAllPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: FutureBuilder<List<Pokemon>>(
        future: futureName,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }  else {
            int index = 0; // Assumindo que o índice desejado é 0
            Pokemon pokemon = snapshot.data![index];
            return GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: [
                Text(pokemon.name),
              ],
            );
          }
        }
      ),
    );
  }
}
