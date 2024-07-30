import 'package:flutter/material.dart';

import '../../common/models/pokemon.dart';
import 'widgets/details_body.dart';

class DetailPage extends StatelessWidget {
  final Pokemon pokemon;

  const DetailPage({super.key, required this.pokemon});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DetailsBody(pokemon: pokemon,),
      );
  }
}