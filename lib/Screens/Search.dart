
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tv/Widgets/tv.dart';

import 'Controller.dart';

class SreachScreen extends StatelessWidget {
  String value='';
  FullController controller =Get.put(FullController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FullController>(
      builder: (controller){
         return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
              labelText: '',
              icon:Icon(Icons.search)
            ),
            onSubmitted:(String k){
              controller.t ?value=k:k='';
             
            } ,
          ),
        ),
        body: SrechResultView(value),
      )
    );
      });
    
  }
}
