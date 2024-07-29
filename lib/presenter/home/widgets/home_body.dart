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
        crossAxisCount: 3,
      ),
        itemCount: _controller.pokemons.length,
        itemBuilder: (context, index) {
          final pokemon = _controller.pokemons[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/details', arguments: pokemon);
            },
            child: Center(child: Text(pokemon.name)),
          );
        },
      );
  }
}