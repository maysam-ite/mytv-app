import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_tv/API/models/tvShow.dart';
import 'package:my_tv/Screens/Drawer.dart';
import 'package:my_tv/Screens/Elements.dart';
import 'package:my_tv/Screens/movie.dart';
import 'package:my_tv/Widgets/tv.dart';
import 'default.dart';

class SeriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      title: 'series',
      content: getShowsWidget(tvShowWidget.getTop250Serirs()),
      drawer: DrawerScreen(
        type: 'Top250Movies',
        image: 'images/BestMovies.jpeg',
        widget: MovieScreen(),
      ),
    );
  }
}

class ShowInfoScreenSeries extends StatelessWidget{
  final tvModel model;


  ShowInfoScreenSeries(this.model);
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

