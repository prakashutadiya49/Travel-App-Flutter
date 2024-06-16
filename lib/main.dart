import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_1/cubit/applogic.dart';
import 'package:project_1/cubit/cubit_bloc.dart';
import 'package:project_1/data_fetch_services/data_services.dart';
import 'package:project_1/pages/detail_page.dart';
import 'package:project_1/pages/navpages/main_page.dart';
import 'pages/Welcome_page.dart';
import 'dart:ffi';

void main(){
  runApp(project1());
}
class project1 extends StatelessWidget {
  const project1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<cubitbloc>(create: (context)=>cubitbloc(data: DataService()),child:const Applogic() ,),
    );
  }
}
