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
        
       return InkWell(
         splashColor: const Color.fromARGB(255, 10, 2, 78),
         onTap: () {
           Navigator.of(context).pushNamed('/details', arguments: pokemon);
         },
         child: Padding(
           padding: const EdgeInsets.only(left: 1, right: 1, top: 3, bottom: 5),
           child: DecoratedBox(
             decoration: const BoxDecoration(
              boxShadow:  [
                BoxShadow(
                  color: Color.fromARGB(255, 72, 61, 61),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
               gradient: LinearGradient(colors: [
                 Color.fromARGB(255, 54, 165, 255),
                 Color.fromARGB(255, 13, 0, 127),
                 Color.fromARGB(184, 25, 21, 51),
               ],
               begin: Alignment.topCenter,
               end: Alignment.bottomCenter
               ),
               borderRadius: BorderRadius.all(Radius.circular(22)),
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Image.network(pokemon.image, width: 150,),
                 const SizedBox(height: 3),
                 Text(
                   pokemon.name,
                   style: const TextStyle(
                    color: Color.fromARGB(255, 190, 205, 255),
                     fontSize: 22,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ],
             ),
           ),
         ),
         
       );
      },
    );
  }
}
