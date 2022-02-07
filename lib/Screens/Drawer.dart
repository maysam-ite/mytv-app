import 'package:flutter/material.dart';
import 'package:my_tv/Screens/Search.dart';
import 'package:my_tv/Screens/Setting.dart';

class DrawerScreen extends StatelessWidget {
  final String type;
  final String image;
  final Widget widget;
  DrawerScreen({required this.type,required this.image,required this.widget});
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container( 
           width: size.width*0.8,
           height: size.height,
           color: Theme.of(context).backgroundColor,
           margin: EdgeInsets.only(right: 10),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Expanded(
                 child: Container(
                   width: double.infinity,
                   height: double.infinity,
                   margin: EdgeInsets.all(5),
                   decoration: BoxDecoration(
                     image: DecorationImage(
                       image:AssetImage('images/d.jpeg'),
                       fit: BoxFit.fill,
                      alignment: Alignment.center,
                     ),
                     color: Colors.red,
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(top: 20,bottom: 10),
                 child: ListTile(
                   title:Text(type,style: TextStyle(
                     fontSize: 20,
                    // color:Colors.black
                   ),
                   ),
                   leading: GestureDetector(
                     child: CircleAvatar(
                       foregroundImage: AssetImage(image),
                       radius: 20,
                       ),
                     onTap: (){
                         Navigator.push(context, MaterialPageRoute(
                           builder: (context){
                             return widget;
                           })
                           );
                     }
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(top:10,bottom:10),
                 child: ListTile(
                   title: Text("Search",
                   style: TextStyle(
                     fontSize: 20,
                    // color: Colors.black
                   ),
                   ),
                   leading: GestureDetector(
                     child: Icon(
                       Icons.search,
                       size: 50,
                      // color: Colors.grey
                       ),
                     onTap: (){ Navigator.push(context, MaterialPageRoute(
                           builder: (context){
                             return SreachScreen();
                           })
                           );
                     }
                    ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(top:10,bottom:10),
                 child: ListTile(
                   title: Text("Setting",
                   style: TextStyle(
                     fontSize: 20,
                   //  color: Colors.black
                   ),
                   ),
                   leading: GestureDetector(
                     child: Icon(
                       Icons.settings,
                       size: 50,
                      // color: Colors.grey,
                       ),
                     onTap: (){ Navigator.push(context, MaterialPageRoute(
                           builder: (context){
                             return SettingScreen();
                           })
                           );
                     }
                    ),
                 ),
               )
             ],
           )
         );
          
  }
}