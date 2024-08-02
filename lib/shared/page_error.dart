import 'package:flutter/material.dart';

class PageError extends StatelessWidget {
  const PageError({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('error'),
      ),
    );
  }
}