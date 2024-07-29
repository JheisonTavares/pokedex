import 'package:flutter/material.dart';

import '../../common/models/pokemon.dart';
import '../../shared/custom_app_bar.dart';
import '../details/pages/detail_page.dart';

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
              Navigator.push(
               context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(pokemon: list[index]),
                ),
              );
            },
            child: Card(
              child: Center(
                child: ListTile(
                  title: Text(list[index].name),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
