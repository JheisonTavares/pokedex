import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../common/controllers/home_controller.dart';
import '../../../common/models/pokemon.dart';
import '../../../common/repositories/pokemon_repository.dart';

class DetailsBody extends StatefulWidget {
  final Pokemon pokemon;

  const DetailsBody({super.key, required this.pokemon});

  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  late PokemonController _controller;


  @override
  void initState() {
    super.initState();
    _controller = PokemonController(repository: PokemonRepository(dio: Dio()));
    _loadData();
  }

  Future<void> _loadData() async {
    await _controller.fetchPokemons();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(216, 51, 58, 93),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(236, 10, 1, 77),
        leading: IconButton(
          color: const Color.fromARGB(255, 186, 197, 255),
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Details of ${widget.pokemon.name}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 186, 197, 255),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 200,
              child: Card(
                  color: const Color.fromARGB(118, 134, 161, 196),
                  elevation: 10,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 9.0, top: 4.0, right: 0, bottom: 0),
                          child: Text(
                            widget.pokemon.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Image.network(
                        widget.pokemon.image,
                        scale: 1,
                        fit: BoxFit.contain,
                      ),
                    ],
                  )),
            ),
            Center(
              child: SizedBox(
                width: 300,
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    side: BorderSide(color: Colors.black, width: 1),
                  ),
                  elevation: 10,
                  color: const Color.fromARGB(118, 148, 176, 221),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0, top: 4.0),
                          child: Text(
                            'Type',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          widget.pokemon.type.toString(),
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Center(
                  child: SizedBox(
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero),
                        side: BorderSide(color: Colors.black, width: 1),
                      ),
                      elevation: 10,
                      color: const Color.fromARGB(118, 148, 176, 221),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0, top: 4.0),
                              child: SizedBox(
                                width: constraints.maxWidth * 0.7,
                                child: Text(
                                  "Height: ${widget.pokemon.height}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 9),
                            child: Text( widget.pokemon.weight ?? ''),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
