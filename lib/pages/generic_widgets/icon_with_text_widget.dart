import 'package:flutter/material.dart';

class IconWithTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  IconWithTextWidget({
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          icon,
          size: 90,
          color: color,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 22, color: color),
        )
      ],
    );
  }
}
