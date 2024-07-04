import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key, required List<ListTile> children});

  @override
  CustomCardState createState() => CustomCardState();
}
class CustomCardState extends State<CustomCard> {
  bool isTapped = false;

void _handleTap() {
  setState(() {
    isTapped = !isTapped;
  });
}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _handleTap,
      child: Card(
        color: isTapped ? Colors.deepPurpleAccent : Colors.greenAccent,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Clique no card',
                style: TextStyle(
                  color: isTapped ? Colors.white : Colors.black,
                  fontSize: 20,
                ),
                 ),
              const SizedBox(height: 10),
              Icon(
                isTapped ? Icons.check_circle : Icons.touch_app,
                color: isTapped ? Colors.white : Colors.black,
                size: 40,
              ),
            ],
        ),
      ),
    ),
    );
  }
  }