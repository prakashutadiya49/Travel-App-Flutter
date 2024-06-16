import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_1/Components/App_Buttons.dart';
import 'package:project_1/Components/Responsive_Button.dart';
import 'package:project_1/colors/colors.dart';
import 'package:project_1/cubit/cubit_bloc.dart';
import 'package:project_1/cubit/cubit_state.dart';
import 'package:project_1/textstyles/app_large_text.dart';
import 'package:project_1/textstyles/app_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedindex = -1;
  bool fav = false;
  Color iconcolor=Colors.black;

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;

    return BlocBuilder<cubitbloc,cubitstate>(builder: (context,state){
      imageclickdatastate imageplacedata=state as imageclickdatastate;
      return Scaffold(
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  child: Container(
                    height: screenheight * 0.35,
                    width: screenwidth,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage( "http://mark.bslmeiyu.com/uploads/" +
                                imageplacedata.place.img), fit: BoxFit.cover)),
                  )),
              Positioned(
                top: 280,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                  height: screenheight * 0.65,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Applargetext(
                            text: imageplacedata.place.name,
                            color: Colors.black,
                          ),
                          Applargetext(
                            text: "\$${imageplacedata.place.price}",
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Apptext(
                            text: imageplacedata.place.location,
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Wrap(
                            alignment: WrapAlignment.start,
                            children: List.generate(5, (index) {
                              return Icon(Icons.star,
                                  color: index < imageplacedata.place.stars
                                      ? AppColors.starColor
                                      : AppColors.textColor2);
                            }),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Apptext(
                            text: "(5.0)",
                            color: AppColors.textColor2,
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      Applargetext(
                        text: "people",
                        color: Colors.black.withOpacity(0.8),
                        size: 24,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Apptext(
                        text: "Number of people in your group",
                        color: Colors.grey.withOpacity(0.8),
                      ),
                      SizedBox(height: 20),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedindex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 12),
                              child: appbuttons(
                                  iconcolor: iconcolor,
                                  text: (index + 1).toString(),
                                  textcolor: selectedindex == index
                                      ? Colors.white
                                      : Colors.black,
                                  icon: Icons.favorite_border,
                                  isIcon: false,
                                  color: selectedindex == index
                                      ? Colors.white
                                      : Colors.black,
                                  bgcolor: selectedindex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  size: 50,
                                  bordercolor: selectedindex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 30),
                      Applargetext(
                        text: "Description",
                        color: Colors.black.withOpacity(0.8),
                      ),
                      SizedBox(height: 20),
                      Apptext(
                        text:imageplacedata.place.description,
                        color: AppColors.mainTextColor,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 40,
                  left: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<cubitbloc>(context).goHome();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 230),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  )),
              Positioned(
                  left: 20,
                  bottom: 20,
                  right: 20,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            fav = true;
                            iconcolor=Colors.redAccent;
                          });
                        },
                        onDoubleTap: () {
                          setState(() {
                            fav = false;
                            iconcolor=Colors.black;
                          });
                        },
                        child: appbuttons(
                          iconcolor: iconcolor,
                          color: AppColors.buttonBackground,
                          bgcolor: AppColors.buttonBackground,
                          size: 50,
                          bordercolor: AppColors.mainColor,
                          textcolor: Colors.black,
                          icon: fav == false
                              ? Icons.favorite_border
                              : Icons.favorite,
                          isIcon: true,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ResponsiveButton(
                        isResponsive: true,
                        width: 250,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      );
    });
  }
}
