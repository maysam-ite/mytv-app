import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_tv/API/Controllers/ShowController.dart';
import 'package:my_tv/API/models/tvShow.dart';
import 'package:my_tv/Screens/default.dart';
import 'package:my_tv/Screens/movie.dart';

class tvShowWidget extends StatelessWidget {
  final tvModel model;


  tvShowWidget(this.model);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double length = min(size.height, size.width);//عبنقسم حسب الطول الاصغر

    return GestureDetector(
      child: Container(
        width: length*.45,
        height: length*.75,
        margin: EdgeInsets.all(length*.025),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(length*0.05),
          color: Theme.of(context).cardColor,

        ),

        child: Column(
          children: [
            Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.all(length*0.05),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,//حتى تتمدد الصورة
                      image: NetworkImage(model.image)
                  ),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(length*0.05)),
              ),
            ),
          ),
            ListTile(

              title: Text(model.title),
              subtitle: Row(
                children: [
                  Icon(Icons.star,color: Colors.amber,),
                  Text('${model.imDbRating}/10'),
                ],
              ),
              trailing: Text(model.rank),
            )
          ],
        ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context){
          return ShowInfoScreen(model);
        }));
      },
    );
  }

  static Future<List<Widget>> getTop250TVs()async{
    List<tvModel> models = await ShowController().getTop250TVs();

    List<Widget> widgets = [];
    for(var x in models){
      widgets.add(tvShowWidget(x));//عبولد مصفوفة من الويدجت بكل لفة من حلقة فور
    }
    return widgets;
  }
  static Future<List<Widget>> getTop250Serirs() async{
    List<tvModel> models=await ShowController().getTop250Serirs();
    List<Widget> widgets=[];
    for(var x in models){
      widgets.add(tvShowWidget(x));
    }
    return widgets;
  }
  
}
class SrechResultView extends StatelessWidget {
  
  final String value;
  SrechResultView(this.value);
  @override
  Widget build(BuildContext context) {
   
      return FutureBuilder(
        future: ShowController().search(value),
        builder:(context,snapshot){
          if(snapshot.hasData){
            List<searchModel> models=(snapshot.data as List<searchModel>);
            if(models.isEmpty){
              return Container(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child:Text('no result')
                ),
              );
            }
            return ListView.builder(
              itemCount: models.length,
              itemBuilder: (context,i){
                return Card(
                  child: ListTile(
                    title: Text(models[i].title),
                    subtitle: Text(models[i].descripition),
                    leading: CircleAvatar(
                      foregroundImage: NetworkImage(models[i].image),
                    ),
                  ),
                );
              }
              );
          }
          else if (snapshot.hasError) {
            return  const Center(
              child:Text('No Internet Connection'),
            );
          }


          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        
      );
    
  }
}