import 'package:flutter/material.dart';
import 'package:weather_man/Core/routes.dart';

class WeatherMan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeScreen,
      routes: Routes.routes(),
    );
  }
}
