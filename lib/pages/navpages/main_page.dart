import 'package:flutter/material.dart';
import 'package:project_1/pages/navpages/analysis_page.dart';
import 'package:project_1/pages/navpages/home_page.dart';
import 'package:project_1/pages/navpages/profile_page.dart';
import 'package:project_1/pages/navpages/search_page.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  List pages=[
    Homepage(),
    // Mainpage(),
    Aanalysispage(),
    Searchpage(),
    Profilepage(),
  ];
  int currentindex=0;
  void ontap(int tapindex){
    setState(() {
      currentindex=tapindex;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        // defult type is shifting and background color not change
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap:ontap ,  // when icon click currentidex pass automatic
         currentIndex: currentindex,
         selectedItemColor: Colors.black,
          iconSize: 27,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items:  [
            BottomNavigationBarItem(icon: Icon(Icons.apps),label: "main"),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart_sharp),label: "analysis"),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: "search"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "profile"),
          ]
      ),

      body: pages[currentindex],
    );
  }
}
