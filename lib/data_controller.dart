import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/Modal/data_modal.dart';
import 'package:test_project/apiHelper.dart';

class DataController extends GetxController{

  List<ItemModal> listData = <ItemModal>[].obs ;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    fetchData();

  }
  fetchData() async{
    List<ItemModal>? list = await APIHelper().getData();
     listData.addAll(list!);

    print('listData --- ${listData.length}');
  }


}