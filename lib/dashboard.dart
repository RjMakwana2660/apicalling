import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/apiHelper.dart';
import 'package:test_project/data_controller.dart';
import 'package:test_project/details_screen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  // DataController d = DataController();
  DataController d = Get.put(DataController());




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('object');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
          ()=> ListView.builder(
            itemCount: d.listData.length,
            itemBuilder: (context,index){
              return GestureDetector(
                child: Card(
                  child:Column(
                    children: [
                      Row(
                        children: [
                          Text("${d.listData[index].name}"),
                          Text("${d.listData[index].icao}"),
                        ],
                      ) ,
                      Row(
                        children: [
                          Text("${d.listData[index].city},${d.listData[index].state}"),
                          Text("${d.listData[index].country}"),
                        ],
                      )
                    ],
                  ),
                ),
                onTap: (){
                  Get.to(()=> DetailsView(itemModal: d.listData[index]));
                },
              );
            },
          )
      )
    );
  }
}

/*
Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Center(child: Text('data')),

ElevatedButton(onPressed: (){
// APIHelper.getData();
},
child: Text('Get Data'))
],
),*/
