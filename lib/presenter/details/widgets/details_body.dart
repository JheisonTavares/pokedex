import 'package:flutter/material.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, int index) {
        return const ListTile(
          title: Text('quadrado'),
        );
      },
    );
  }
}