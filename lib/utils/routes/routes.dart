import 'package:flutter/material.dart';
import 'package:testing2/utils/routes/routes_names.dart';
import 'package:testing2/view/result_screen.dart';
import '../../view/home_screen.dart';
import '../../view/intro_screen.dart';

class Routes{
  static Route<dynamic> generateRoutes(RouteSettings settings){
    switch(settings.name){
      case RoutesNames.intro:
        return MaterialPageRoute(builder: (BuildContext context)=>IntroScreen());
      case RoutesNames.home:
        return MaterialPageRoute(builder: (BuildContext context)=>HomeScreen());
      case RoutesNames.result:
        return MaterialPageRoute(builder: (BuildContext context)=>ResultScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body:SafeArea(child: Center(child: Text('No route defined',style: TextStyle(fontSize: 40),))) ,
          );
        });
    }
  }
}