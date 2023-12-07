import 'package:VALTO/pages/gracias_page.dart';
import 'package:flutter/material.dart';
import 'package:VALTO/pages/home.dart';

Map<String, WidgetBuilder> getAplicationRoutes(){
  return <String,WidgetBuilder>{
        'home'              :(BuildContext context)=>const Home(),
        'gracias'           :(BuildContext context)=>const GraciasScreen(),
      };
}

