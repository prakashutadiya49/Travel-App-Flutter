import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/Datamodel.dart';

class DataService {
  String baseUrl = "http://mark.bslmeiyu.com/api";

  Future<List<DataModel>> getdata() async {
    String apiurl = "/getplaces";
    http.Response response = await http.get(Uri.parse(baseUrl + apiurl));
    print(response);
    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        print(list);
        return list.map((e) => DataModel.datamodelfromJson(e)).toList();
      }
      else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}

