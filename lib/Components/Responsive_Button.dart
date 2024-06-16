import 'package:flutter/material.dart';
import 'package:project_1/colors/colors.dart';
import 'package:project_1/textstyles/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  
  final double width;
  final bool isResponsive;

  const ResponsiveButton({super.key, required this.width, this.isResponsive=false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>{
      },
      child: Flexible(
        child: Container(
          width: width,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(10),
          ),
          
          child: Row(
            mainAxisAlignment:isResponsive==true?MainAxisAlignment.spaceAround:MainAxisAlignment.center,
            children: [
              isResponsive==true?Apptext(text: "Book Trip Now",color: Colors.white,):Container(),
              Image.asset("images/button-one.png",fit: BoxFit.cover,),
            ],
          ),
        ),
      ),
    );
  }
}
