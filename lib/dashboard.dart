import 'package:flutter/material.dart';
import 'package:test_project/apiHelper.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('object');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('data')),

          ElevatedButton(onPressed: (){
            APIHelper.getData();
          },
              child: Text('Get Data'))
        ],
      ),
    );
  }
}
