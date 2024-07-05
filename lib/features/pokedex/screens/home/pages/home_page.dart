import 'package:flutter/material.dart';
import 'package:flutter_pokedex/shared/custom_app_bar.dart';

import '../../../../../common/models/pokemon.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.list});
  final List<Pokemon> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/details");
            },
            child: Card(
              child: ListTile(
                title: Text(list[index].name),
              ),
            ),
          );
        },
      ),
    );
  }
}
