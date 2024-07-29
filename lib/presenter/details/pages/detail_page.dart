import 'package:flutter/material.dart';

import '../../../common/models/pokemon.dart';

class DetailPage extends StatefulWidget {
  final Pokemon pokemon;

  const DetailPage({super.key, required this.pokemon});

  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  // late Future<List<Pokemon>> futureName;

  // @override
  // void initState() {
  //   super.initState();
  //   futureName = PokemonRepository(dio: Dio()).getAllPokemons();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Details"),
        ),
        body: Column(
          children: [
            Center(
              child: Text(widget.pokemon.name),
            ),
            Card(
              child: Image.network(
                widget.pokemon.image,
              ),
            ),
          ],
        )
        // FutureBuilder<List<Pokemon>>(
        //   future: futureName,
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(child: CircularProgressIndicator());
        //     } else if (snapshot.hasError) {
        //       return Center(child: Text('Erro: ${snapshot.error}'));
        //     }  else {
        //       int index = 0; // Assumindo que o índice desejado é 0
        //       Pokemon pokemon = snapshot.data![index];
        //       return GridView(
        //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 2,
        //         ),
        //         children: [
        //           Text(pokemon.name),
        //         ],
        //       );
        //     }
        //   }
        // ),
        );
  }
}
