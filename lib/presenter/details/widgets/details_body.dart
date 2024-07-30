import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../common/controllers/home_controller.dart';
import '../../../common/models/pokemon.dart';
import '../../../common/repositories/pokemon_repository.dart';

class DetailsBody extends StatefulWidget {
  final Pokemon pokemon;

   const DetailsBody({super.key,required this.pokemon});

  @override
  State <DetailsBody> createState() =>  _DetailsBodyState();
}

class  _DetailsBodyState extends State <DetailsBody> {
  late PokemonController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PokemonController(repository: PokemonRepository(dio: Dio()));
    _loadData();
  }

  Future<void> _loadData() async {
    await _controller.fetchPokemons();
    setState(() {}); // Atualiza a interface do usuário após buscar os dados
  }
  
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.pokemon.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                widget.pokemon.type.toString(),
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            Image.network(widget.pokemon.image),
          ],
        ),
      ),
    );
  }
}