import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_tv/API/models/tvShow.dart';
import 'package:my_tv/Screens/Drawer.dart';
import 'package:my_tv/Screens/Elements.dart';
import 'package:my_tv/Screens/series.dart';
import 'package:my_tv/Widgets/tv.dart';
import 'default.dart';
class MovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      title: 'movie',
      content: getShowsWidget(tvShowWidget.getTop250TVs()),
      drawer: DrawerScreen(
        type: 'Top250Series',
        image: 'images/BestSeries.jpeg',
        widget: SeriesScreen(),
      ),
    );
  }
}

class ShowInfoScreen extends StatelessWidget{
  final tvModel model;


  ShowInfoScreen(this.model);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DefaultScreen(
      title: model.title,
      content: OrientationBuilder(
        builder: (context,orientation) {
          List<Widget> content = [
            Expanded(
              flex: 9,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.center,
                      image: NetworkImage(model.image)
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child:ShowInfoWidget(model) ,

            )
          ];
          return orientation == Orientation.portrait ? Column(children: content,):Row(children: content,);
        }
      ),
    );
  }
}


