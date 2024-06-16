import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_1/cubit/cubit_bloc.dart';
import 'package:project_1/textstyles/app_large_text.dart';
import 'package:project_1/textstyles/app_text.dart';
import 'package:project_1/colors/colors.dart';
import 'package:project_1/Components/Responsive_Button.dart';

class Welcomepage extends StatefulWidget {
  const Welcomepage({super.key});

  @override
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  List images = ["welcome-one.png", "welcome-two.png", "welcome-three.png"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 3,
          scrollDirection: Axis.vertical,
          itemBuilder: (_, SlidepageIndex) {
            return Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/" + images[SlidepageIndex]),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 120, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Applargetext(text: "Trips"),
                        Apptext(
                          text: "Mountain",
                          size: 30,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 250,
                          child: Apptext(
                            text:
                                "Mountain hikes give you an incredible sence of freadom along with endurnce tests",
                            color: AppColors.textColor2,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onDoubleTap: (){
                            context.read<cubitbloc>().getdata();
                          }
                            ,
                            child: ResponsiveButton(width: 100,isResponsive: false,)),
                      ],
                    ),
                    Column(
                      children: List.generate(3, (dotindex){
                        return Container(
                          margin: EdgeInsets.all(2),
                          width: 8,
                          height: (SlidepageIndex==dotindex)? 25:8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: (SlidepageIndex==dotindex)? AppColors.mainColor:AppColors.mainColor.withOpacity(0.3),
                          ),
                        );
                      }
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
