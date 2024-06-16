import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_1/cubit/cubit_bloc.dart';
import 'package:project_1/cubit/cubit_state.dart';
import 'package:project_1/pages/Welcome_page.dart';
import 'package:project_1/pages/detail_page.dart';
import 'package:project_1/pages/navpages/home_page.dart';

class Applogic extends StatefulWidget {
  const Applogic({super.key});

  @override
  State<Applogic> createState() => _ApplogicState();
}

class _ApplogicState extends State<Applogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<cubitbloc, cubitstate>(builder: (context, state) {
        if (state is appwelcomestate) {
          return Welcomepage();
        }
        if (state is dataloadedstate) {
          return Homepage();
        }
        if(state is imageclickdatastate){
          return DetailPage();
        }
        if(state is dataloadingstate){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else {
          return Container();
        }


      }),
    );
  }
}
