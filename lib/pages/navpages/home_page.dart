import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_1/colors/colors.dart';
import 'package:project_1/cubit/cubit_bloc.dart';
import 'package:project_1/cubit/cubit_state.dart';
import 'package:project_1/textstyles/app_large_text.dart';
import 'package:project_1/textstyles/app_text.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  List activityimages=["balloning.png","hiking.png","kayaking.png","snorkling.png"];
 var activitytext=["Balloning","Hiking","Kayaking","Snorking"];
  @override
  Widget build(BuildContext context) {
    TabController tabController=TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: Colors.white,
      body:BlocBuilder<cubitbloc,cubitstate>(builder:(context,state){
        if(state is dataloadedstate){
          var fetchdata=state.places;
          return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.black,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        CupertinoIcons.profile_circled,
                        size: 40,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Applargetext(text: "Discover"),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelPadding: const EdgeInsets.only(left: 20,right: 20),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Colors.blue,
                    controller: tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicator: customlabel(color: AppColors.mainColor,radius: 4),
                    tabs: [
                      Tab(
                        text: "Places",
                      ),
                      Tab(
                        text: "Insprations",
                      ),
                      Tab(
                        text: "Emotions",
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 300,
                width: double.infinity,
                child: TabBarView(
                    controller: tabController,
                    children: [
                      ListView.builder(
                          padding: EdgeInsets.only(left: 15),
                          itemCount:fetchdata.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context,int index){
                            return  GestureDetector(
                              onTap: (){
                                context.read<cubitbloc>().getimagedata(fetchdata[index]);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 15,top: 10),
                                height: 100,
                                width: 200,
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              image: DecorationImage(
                              image: NetworkImage(
                              "http://mark.bslmeiyu.com/uploads/" +
                              fetchdata[index].img),
                              fit: BoxFit.cover),
                                ),
                              ),
                            );
                          }
                      ),
                      Text("2"),
                      Text("3"),
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Applargetext(text: "Explore more",size: 20,),
                    Apptext(text: "See all",color: AppColors.textColor1,),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                width: double.maxFinite,
                child: ListView.builder(
                    itemCount:4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_,int index){
                      return Container(
                        margin: EdgeInsets.only(top: 15,right: 15,left: 20),
                        child: Column(
                          children: [
                            Container(
                              // margin: EdgeInsets.only(top: 15,right: 20),
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey.withOpacity(0.5),
                                image: DecorationImage(image: AssetImage("images/"+activityimages[index]),fit: BoxFit.cover),
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Center(child: Apptext(text:activitytext[index],size: 13,)),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          );
        }
        else{
          return Container();
        }
      } ));
  }
}

class customlabel extends Decoration{
  final Color color;
  final double radius;
  customlabel({required this.color,required this.radius });
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
     return boxpainter(color: color,radius: radius);
  }

}

class boxpainter extends BoxPainter{
  @override
  final Color color;
  double radius;
  boxpainter({required this.color,required this.radius });

  void paint(Canvas canvas,
      Offset offset,
      ImageConfiguration configuration) {
      Paint paintobject=Paint();
      paintobject.color=color;
      paintobject.isAntiAlias=true;
      final Offset circleoffset=Offset(configuration.size!.width/2, configuration.size!.height/1.2);
      canvas.drawCircle(offset+circleoffset, radius, paintobject);

  }

}