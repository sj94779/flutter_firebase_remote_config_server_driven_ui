import 'dart:convert';
import 'package:flutter/material.dart';


class MapDataToWidget{
  List<Widget> serverWidgets = [];

  mapWidgets(serverUI){
    for(var element in jsonDecode(serverUI)){
      String type = element['type'];
      serverWidgets.add(toWidget(element, type));
    }
    return serverWidgets;
  }

  toWidget(element, type){
    switch(type){
      case 'FlutterLogo':
        return FlutterLogo(
          size: (element['size']).toDouble(),
        );
      default:
        return (const Text("error"));
    }
  }

}