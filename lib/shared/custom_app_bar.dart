import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
    
      centerTitle: true,
      title: const Text(
        'Pokedex ',
        
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: const Color.fromARGB(238, 255, 32, 32),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
