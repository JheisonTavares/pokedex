// lib/views/home_screen.dart

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../common/controllers/home_controller.dart';
import '../../../common/repositories/pokemon_repository.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
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
    return  GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
        itemCount: 32,
        itemBuilder: (context, index) {
          final pokemon = _controller.pokemons[index];
          return  InkWell(
            splashColor: Colors.green[100],
            onTap: () {
              Navigator.of(context).pushNamed('/details', arguments: pokemon);
            },
            child: Center(
              child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
              Image.network(pokemon.image),
              const SizedBox(height: 15),
              Text(
                pokemon.name,
                style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                )
                ],
              ),
            ),
          );
        },
      );
  }
}