import 'package:flutter/material.dart';
import 'package:weather_app/screens/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MyHomePage();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  ///Todo Push Notification of current weather.
  ///Todo Adsense.
  ///Todo Connect to Iphone
  ///Todo Custom Widget
  ///Todo
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: WeatherScreen(),
      ),
    );
  }
}
