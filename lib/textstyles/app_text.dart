import 'package:flutter/material.dart';

class Apptext extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  const Apptext({super.key,this.color=Colors.black54, required this.text, this.size=16});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: TextStyle(
      color: color,
      fontSize: size,
    ),
    );
  }
}
