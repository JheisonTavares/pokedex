import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../common/controllers/home_controller.dart';
import '../../common/repositories/pokemon_repository.dart';
import '../../shared/custom_app_bar.dart';
import 'widgets/home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Container(
      margin: EdgeInsets.zero,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 119, 194, 255),
        appBar: const CustomAppBar(),
        body: HomeBody(
          pokemonsController: _controller,
        ),
        floatingActionButton: SizedBox(
          width: 50,
          height: 50,
          child: FloatingActionButton(
            backgroundColor: const Color.fromARGB(115, 13, 71, 232),
              onPressed: _loadData, elevation: 10, child: const Icon(Icons.refresh, size: 30,color: Colors.white,) ,),
        ),
      ),
    );
  }
}
