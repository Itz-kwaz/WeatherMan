import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_man/Core/Weather.dart';
import 'package:location/location.dart';
import '../constants.dart';

class WeatherModel extends ChangeNotifier{

  double latitude;
  double longitude;
  Weather currentWeather = Weather();
bool isLoading = true;

  List<Weather> hourlyWeatherList = [];
  Future<void> fetchData() async{
    await getLocation();
    //TODO: Add an error field
    try{
      Map<String,dynamic> queryParams = {
        'lat' : latitude,
        'lon' : longitude,
        'exclude' : 'alerts,minutely',
        'appid' : API_KEY
      };
      Response response = await Dio().get(ONE_CALL_URL,queryParameters: queryParams);
      if(response.statusCode == 200){
        currentWeather = Weather.fromJson(response.data['current']);

        hourlyWeatherList = response.data['hourly'].map<Weather>((json) => Weather.fromJson(json)).toList();
        var date = DateTime.fromMillisecondsSinceEpoch(hourlyWeatherList.elementAt(0).time * 1000, isUtc: true);
        print('The time of the first hourly weather is ${date.toString()}');


      }
    } on DioError catch(e){

    }
    finally{
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getLocation () async{
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    latitude = _locationData.latitude;
    longitude = _locationData.longitude;
  }
}