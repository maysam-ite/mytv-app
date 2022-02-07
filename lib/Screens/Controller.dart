import 'package:flutter/material.dart';
import 'package:get/get.dart';
class FullController extends GetxController{
   String searchinput='';
   bool isdarkmode=false;
   void toggeldarkmode(){
     if(isdarkmode) Get.changeTheme(ThemeData.dark());
     else Get.changeTheme(ThemeData.light());
     update();
   }
   bool t=false;
   void press(){
     t=!t;
     update();
   }
   
}

class SettingElement extends StatelessWidget{
 @override
  Widget build(BuildContext context) {
    Get.put(FullController());
    return  GetBuilder<FullController>(
        builder: (controller){
           return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child:SwitchListTile(
        value: controller.isdarkmode,
        title: Text("Dark Mode",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
        ),
        activeColor: Colors.greenAccent,
        onChanged:(bool l){
           controller.isdarkmode=l;
          controller.toggeldarkmode();
          //update();
        } ,
      )
                );
        }
    );
     
     
    
  }
}
        