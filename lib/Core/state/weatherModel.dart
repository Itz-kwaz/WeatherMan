import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_man/Core/hourlyWeather.dart';

import '../constants.dart';

class WeatherModel{
  var temperature;
  var weatherCondition;
  var windSpeed;
  var cloudiness;
  var humidity;
  var sunrise;
  var sunset;
  var weatherIcon;

  List<HourlyWeather> hourlyWeatherList = [];
  Future<void> fetchData() async{
    try{
      Response response = await Dio().get(ONE_CALL_URL);
      if(response.statusCode == 200){
        print(response.data);
        var currentData = response.data['current'];
        temperature = currentData['temp'];
        humidity  = currentData['humidity'];
        windSpeed = currentData['wind_speed'];
        sunrise = currentData['sunrise'];
        sunset = currentData['sunset'];
        cloudiness = currentData['clouds'];
        weatherCondition = currentData[0]['description'];
        weatherIcon = currentData[0]['icon'];


      }
    }catch(e){
      print(e);
    }

  }
}