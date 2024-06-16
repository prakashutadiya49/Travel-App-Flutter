import 'package:flutter/material.dart';

class Applargetext extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  const Applargetext({super.key,this.color=Colors.black, required this.text, this.size=30});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.bold
    ),
    );
  }
}
