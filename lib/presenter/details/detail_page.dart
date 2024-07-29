import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.list, });
  final List<Pokemon> list;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('test'),
      ),
    );
  }
  }