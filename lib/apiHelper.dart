import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:test_project/Modal/data_modal.dart';
import 'package:test_project/data_controller.dart';
// import 'package:http/http.dart' as http;

class APIHelper{
  static const String url = 'https://raw.githubusercontent.com/mwgg/Airports/master/airports.json';
  // DataController dataController = Get.find(da);
  // static const String url = 'https://raw.githubusercontent.com/RjMakwana2660/apicalling/main/airports.json?token=GHSAT0AAAAAAB7DN373JBO7F3PA73QX6CYGY7Z6CWQ';

   Future<List<ItemModal>?> getData() async {
    print('inside get Data');

    try{
      var response = await Dio(BaseOptions(connectTimeout: Duration(minutes: 1))).get(url);
      // var response = await Dio(BaseOptions(connectTimeout: Duration(minutes: 1))).get(url);
      // var response = await http.get(Uri.tryParse(url)!);

      List<ItemModal> listData = [];


      Map data = jsonDecode(response.data);
      print("data.length ${data.length}");
      data.forEach((key, value) {
        listData.add(ItemModal.fromJson(value));
      });
      // dataController.listData = [];

      print('object--> ${listData.length}');


      // print('Data Repsonse --> $response');

      return listData;

    } catch(e){
      print('getData()---> ${e.toString()}');
    }


  }
}