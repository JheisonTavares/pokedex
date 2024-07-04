import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Pokedex',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 147, 33, 33),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
