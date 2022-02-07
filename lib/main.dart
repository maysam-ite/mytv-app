import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_tv/Screens/Controller.dart';

import 'package:my_tv/Screens/default.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: ThemeData.light().copyWith(
      //   scaffoldBackgroundColor: Color(0xFFF4F4F4),
      //   appBarTheme: AppBarTheme(
      //     backgroundColor: Colors.blueGrey
      //   ),
      // ),

      // darkTheme: ThemeData.dark().copyWith(
      //      backgroundColor: Colors.black
      // ),


       home: HomeScreen()
    );
  }
}
