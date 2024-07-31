import 'package:flutter/material.dart';

import '../../shared/custom_app_bar.dart';
import 'widgets/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      child: const Scaffold(
        backgroundColor: Color.fromARGB(255, 119, 194, 255),
        appBar: CustomAppBar(),
        body: HomeBody(),
      ),
      );
  }
}
