import 'package:flutter/cupertino.dart';
import 'package:weather_man/UI/homeScreen.dart';
import 'package:weather_man/UI/next7DaysScreen.dart';

class Routes{

  static const String homeScreen  = '/homeScreen';
  static const String next7DaysScreen = '/next7SaysScreen';

 static Map<String,Widget Function(BuildContext)>routes(){
   return {
     homeScreen : (context) => HomeScreen(),
     next7DaysScreen : (context) => Next7DaysScreen()
   };
 }

}