import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tv/Screens/Controller.dart';
import 'package:my_tv/Screens/default.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      content: SettingElement(),
      title: "Setting",
    );
  }
  
}



      // child:SwitchListTile(
      //   value: t,
      //   title: Text("Dark Mode",
      //   style: TextStyle(
      //     fontSize: 20,
      //     fontWeight: FontWeight.bold
      //   ),
      //   ),
      //   activeColor: Colors.greenAccent,
      //   onChanged:(bool l){
      //     t=l;
      //     controller.toggeldarkmode();
      //     //update();
      //   } ,
      // )
     