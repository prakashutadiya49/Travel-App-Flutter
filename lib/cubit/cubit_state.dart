import 'package:project_1/Model/Datamodel.dart';

class cubitstate{}

class appinitstate extends cubitstate{}

class appwelcomestate extends cubitstate{}

class dataloadingstate extends cubitstate{}

class dataloadedstate extends cubitstate{
  final List<DataModel> places;
  dataloadedstate({ required this.places});
}

class imageclickdatastate extends cubitstate{
  final DataModel place;
  imageclickdatastate({required this.place});
}