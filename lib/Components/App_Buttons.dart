import 'package:flutter/cupertino.dart';
import 'package:project_1/textstyles/app_text.dart';

class appbuttons extends StatelessWidget {
  bool isIcon;
  String? text;
  IconData? icon;
  final Color color;
  final Color bgcolor;
  final double size;
  final Color bordercolor;
  final Color textcolor;
  final Color iconcolor;

   appbuttons({
     required this.iconcolor,
     this.isIcon=false,
     this.text="",
     this.icon,
     required this.color,
     super.key, required this.bgcolor, required this.size, required this.bordercolor, required this.textcolor});

  @override
  Widget build(BuildContext context) {
          return Container(
          height:size,
          width: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: bgcolor,
            border: Border.all(
              color: bordercolor,
              width: 1,
            ),
          ),
            child: isIcon==false?Center(child: Apptext(text: text!,color: textcolor,)):Center(child: Icon(icon,color: iconcolor,)),
        );


  }
}

