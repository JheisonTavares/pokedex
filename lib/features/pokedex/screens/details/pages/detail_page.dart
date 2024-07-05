import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.name});
  final String name;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("Details"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){Navigator.pop(context);}, child: const Text("Go Back"),
        ),
      ),
    );
  }
}
