// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:my_tv/API/models/tvShow.dart';


class ShowController{

  static final ShowController _controller = ShowController._();

  ShowController._();

  factory ShowController(){
    return _controller;
  }

   Future<List<tvModel>> getTop250TVs() async {
    var response = await http.get(Uri.parse('https://imdb-api.com/en/API/Top250Movies/k_8pyhwf30'));
    Map<String,dynamic> data = jsonDecode(response.body);

    List<dynamic> items = data['items'];
    List<tvModel> models = [];
    for(var x in items){
      models.add(tvModel.map(x));
    }
    print(models.length);
    return models;
  }
  Future<List<tvModel>> getTop250Serirs() async{
    var responde=await http.get(Uri.parse('https://jsonkeeper.com/b/O2NC'));//https://imdb-api.com/en/API/Top250TVs/k_c5mb66ix
    Map<String,dynamic> data=jsonDecode(responde.body);
    List<dynamic> item=data['items'];
    List<tvModel> models=[];
    for(var x in item){
       models.add(tvModel.map(x));
    }
    return models;
  }
  Future<List<searchModel>> search(String value) async{
    var responde=await http.get(Uri.parse('https://imdb-api.com/en/API/SearchTitle/k_8pyhwf30/$value'));
    Map<String,dynamic> data= jsonDecode(responde.body);
    List<searchModel> models=[];
    List<dynamic> results=data['results'];
    for(var x in results ){
      models.add(searchModel.map(x));
    }
    return models;
  }

}