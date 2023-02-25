import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;

class APIHelper{
  static const String url = 'https://raw.githubusercontent.com/mwgg/Airports/master/airports.json';

  static void getData() async {
    print('inside get Data');

    try{
      var response = await Dio(BaseOptions(connectTimeout: Duration(minutes: 1))).get(url);
      // var response = await http.get(Uri.parse(url));
      print('Data Repsonse --> $response');




    } catch(e){
      print('getData()---> ${e.toString()}');
    }

  }
}