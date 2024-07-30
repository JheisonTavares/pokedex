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
    return GridView.builder(
      
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
      ),
      itemCount: 32,
      
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        final pokemon = _controller.pokemons[index];
        
        return Container(
        //  margin: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 3),
          child: Card(
            margin: const EdgeInsets.only(left: 2, right: 2, top: 1, bottom: 5),
            color: const Color.fromARGB(73, 0, 94, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
              side: const BorderSide(color: Colors.black, width: 2),
            ),
            child: InkWell(
              splashColor: const Color.fromARGB(255, 10, 2, 78),
              onTap: () {
                Navigator.of(context).pushNamed('/details', arguments: pokemon);
              },
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(pokemon.image),
                    const SizedBox(height: 20),
                    Text(
                      pokemon.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
