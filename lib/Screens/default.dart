import 'package:flutter/material.dart';
import 'package:my_tv/Screens/Elements.dart';

class DefaultScreen extends StatelessWidget {
  final Widget content;
  final String? title;
  final Widget? drawer;
  DefaultScreen({required this.content,this.title,this.drawer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:title != null? AppBar(
        title: Text(title??''),
        centerTitle: true,
        
      ):null,
      body: SafeArea(child: content),
      drawer: drawer,
      //backgroundColor: Theme.of(context).backgroundColor
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      content:HomepageWidget() ,
      title: 'Best sreies&movies',
    );
  }
}
