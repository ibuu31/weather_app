import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_model.dart';

class WeatherClientApi {
  Future<WeatherModel> requestApi() async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=23.0225&lon=72.5714&appid=198c5d70f721bee7ab433ba9e748035b';
    Response response = await Dio().get(url);
    Map<String, dynamic> parsedData = jsonDecode(response.toString());
    final weather = WeatherModel.fromJson(parsedData);
    debugPrint(parsedData.toString());
    return weather;
  }
}
