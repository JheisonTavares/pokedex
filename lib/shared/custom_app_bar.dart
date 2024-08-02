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
          color: Color.fromARGB(255, 186, 197, 255),
          fontWeight: FontWeight.bold,
        ),
      ),
       backgroundColor: const Color.fromARGB(236, 10, 1, 77),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
