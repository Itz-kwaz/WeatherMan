import 'package:intl/intl.dart';

class Weather {
  var time;
  var iconUrl;
  var temperature;
  var weatherCondition;
  var windSpeed;
  var cloudiness;
  var humidity;
  var sunrise;
  var sunset;

  // DateFormat _dateFormat = DateFormat()

  Weather(
      {this.time,
      this.iconUrl,
      this.temperature,
      this.humidity,
      this.windSpeed,
      this.cloudiness,
      this.sunrise,
      this.sunset,
      this.weatherCondition,
      });

  factory Weather.fromJson(Map<String, dynamic> json) {
    var date =
        DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: true);
    return Weather(
      time: json['dt'],
      temperature: json['temp'],
      humidity: json['humidity'],
      windSpeed: json['wind_speed'],
      cloudiness: json['clouds'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      weatherCondition: json['weather'][0]['description'],
      iconUrl: json['weather'][0]['icon'],
    );
  }
}
