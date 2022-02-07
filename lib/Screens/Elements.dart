// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_tv/API/models/tvShow.dart';


import 'package:my_tv/Screens/movie.dart';
import 'package:my_tv/Screens/series.dart';
 
class getShowsWidget extends StatelessWidget {
  final Future<Object> future;

  getShowsWidget(this.future);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, asyncSnapShot) {
          if (asyncSnapShot.hasData) {
            return SingleChildScrollView(
              child:Wrap(
                children: asyncSnapShot.data as List<Widget>,
              ),
            );
          }

          else if (asyncSnapShot.hasError) {
            return  const Center(
              child:Text('No Internet Connection'),
            );
          }


          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
//بس لحتى اعرض المعلومات 
class ShowInfoWidget extends StatelessWidget {
  final tvModel model;

  ShowInfoWidget(this.model);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double length = min(size.height,size.width);
    return Container(

      height: double.infinity,
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.all(length*0.05),
      child: LayoutBuilder(
        builder: (context,constrains) {
          return Column(
            children: [
              Container(
                  child: FittedBox(
                    child: Text(model.fullTitle,style: TextStyle(fontWeight: FontWeight.bold,),
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                margin: EdgeInsets.only(bottom: constrains.maxWidth*.05),
                width: constrains.maxWidth*.8,
              ),
              FittedBox(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        detailsWidget('IMDB rating : ', '${model.imDbRating}/10',widget: Icon(Icons.star,color: Colors.amber,)),
                        detailsWidget('total rates : ', model.imDbRatingCount,),
                        detailsWidget('world rank : ', model.rank,),
                        detailsWidget('year : ', model.year,),
                        detailsWidget('crew : ', model.crew,),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        }
      ),
    );
  }
}

class detailsWidget extends StatelessWidget {
  final String title,content;
  final double factor;
  final Widget? widget;
  detailsWidget(this.title, this.content,{this.factor = .03,this.widget});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: FittedBox(

          child: Row(
            children: [
              Text(title),
              Text(
                content,
                style: TextStyle(fontWeight: FontWeight.bold,),
                
              ),
              widget ?? SizedBox()
            ],
          ),
        ),

      );
  }
}

class HomepageWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
     Size size=MediaQuery.of(context).size;
     double length=min(size.height,size.width);
    return SafeArea(
           child:  Container(
                 width: double.infinity,
                 height: double.infinity,
                 decoration: BoxDecoration(
                   gradient: LinearGradient(
                     colors: [Colors.red,Colors.black],
                     begin: Alignment.bottomLeft,
                     end: Alignment.topRight
                   )
                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     GestureDetector(
                       child:CircleAvatar(
                         foregroundImage: AssetImage('images/BestMovies.jpeg'),
                         radius: 80,
                       ),
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(
                           builder: (context){
                             return MovieScreen();
                           })
                           );
                       },
                       ),
                     Text("Top 250 movies.....",
                     style: TextStyle(
                       fontSize: 15,
                       fontWeight: FontWeight.bold,

                     ), 
                     ),
                      GestureDetector(
                       child:CircleAvatar(
                         foregroundImage: AssetImage('images/BestSeries.jpeg'),
                         radius: 80,
                       ),
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(
                           builder:(context){
                             return SeriesScreen();
                           }
                           )
                           );
                       },
                       ),
                       Text("Top 250 serias.....",
                        style: TextStyle(
                       fontSize: 15,
                       fontWeight: FontWeight.bold,
                     ),
                       ),
                   ],
                 ),
               
             
           ),
         );
  }
}