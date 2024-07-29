import 'package:flutter/material.dart';

import 'widgets/details_body.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
        body: const DetailsBody()
      );
  }
}