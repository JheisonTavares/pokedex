import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../common/controllers/home_controller.dart';
import '../../common/models/pokemon.dart';
import '../../common/repositories/pokemon_repository.dart';
import 'widgets/details_body.dart';

class DetailPage extends StatefulWidget {
  final Pokemon pokemon;

  const DetailPage({super.key, required this.pokemon});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late PokemonController _controller;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = PokemonController(repository: PokemonRepository(dio: Dio()));
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      isLoading = true;
    });

    await _controller.fetchPokemons();

    setState(() {
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
     if (isLoading == true) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
        floatingActionButton: SizedBox(
          width: 50,
          height: 50,
          child: FloatingActionButton(
            backgroundColor: const Color.fromARGB(115, 13, 71, 232),
              onPressed: _loadData, elevation: 10, child: const Icon(Icons.refresh, size: 30,color: Colors.white,) ,),
        ),
        body: DetailsBody(pokemon: widget.pokemon,),
      );
  }
}