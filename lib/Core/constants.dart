import 'package:flutter/cupertino.dart';

const Color kTextColor = Color(0xFF596264);
const Color kWhite = Color(0xFFFFFFFF);
const String API_KEY = 'e344dcc8b8b60513f8a76f7bff183df0';

const String BASE_URL = 'https://api.openweathermap.org/data/2.5/';

const String ONE_CALL_URL = '${BASE_URL}onecall?lat=33.441792&lon=-94.037689&exclude=minutely,alerts&appid=$API_KEY';