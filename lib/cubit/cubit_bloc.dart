import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_1/Model/Datamodel.dart';
import 'package:project_1/cubit/cubit_state.dart';
import 'package:project_1/data_fetch_services/data_services.dart';
import 'package:project_1/pages/navpages/home_page.dart';

class cubitbloc extends Cubit<cubitstate>{
  cubitbloc({required this.data}):super(appinitstate()){
    emit(appwelcomestate());
  }
final DataService data;
  late final places;
  getdata() async{
    try{
      emit(dataloadingstate());
       places=await data.getdata();
      emit(dataloadedstate(places: places));
    }catch(e){
      print(e.toString());
    }
  }

  getimagedata(DataModel place){
    emit(imageclickdatastate(place: place));
  }

  goHome(){
    emit(dataloadedstate(places:places));
  }
}