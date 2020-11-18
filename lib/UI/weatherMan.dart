import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_man/Core/routes.dart';
import 'package:weather_man/Core/state/weatherModel.dart';

class WeatherMan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherModel>(create: (context) => WeatherModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.homeScreen,
        routes: Routes.routes(),
      ),
    );
  }
}
