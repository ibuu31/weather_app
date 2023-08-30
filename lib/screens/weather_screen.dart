import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/api/client_api.dart';
import 'package:weather_app/api/weather_model.dart';
import 'package:weather_app/widgets/card.dart';
import 'package:weather_app/widgets/expanded.dart';
import 'package:weather_app/widgets/padding.dart';
import 'package:weather_app/widgets/textStyle.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    weatherClient;
    super.initState();
  }

  final weatherClient = WeatherClientApi().requestApi();
  late WeatherModel weatherModel = WeatherModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: FutureBuilder(
        future: weatherClient,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            weatherModel = snapshot.data;
            var sunRise = DateFormat('jm').format(
                (DateTime.fromMillisecondsSinceEpoch(
                    weatherModel.sys!.sunrise!.toInt() * 1000)));
            var sunSet = DateFormat('jm').format(
                (DateTime.fromMillisecondsSinceEpoch(
                    weatherModel.sys!.sunset!.toInt() * 1000)));
            DateTime timeAStamp =
                DateTime.fromMillisecondsSinceEpoch(weatherModel.dt! * 1000);
            final currentDate = DateFormat('yMMMd').format(timeAStamp);
            var currentTime = DateTime.now().hour;
            return Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                          height: MediaQuery.of(context).size.height,
                          fit: BoxFit.fitHeight,
                          opacity: const AlwaysStoppedAnimation(0.7),
                          currentTime > 18
                              ? 'images/night.jpeg'
                              : 'images/blue.jpg'),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Center(
                          child: Column(
                            children: [
                              CardWidget(
                                height: 300.0,
                                child: PaddingStyle1(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(weatherModel.name.toString(),
                                          style: textStyleCustom(35.0, null)),
                                      Text(
                                        currentDate.toString(),
                                        style: textStyleCustom(22.0, null),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          PaddingStyle2(
                                            child: Text(
                                                ' ${(weatherModel.main!.temp! ~/ 10)}°C',
                                                style: textStyleCustom(
                                                    35.0, FontWeight.bold)),
                                          ),
                                          PaddingStyle2(
                                            child: Text(
                                                weatherModel.weather![0].main
                                                    .toString(),
                                                style: textStyleCustom(
                                                    30.0, FontWeight.w400)),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "↑",
                                                style: textStyle2(),
                                              ),
                                              Text(
                                                '${weatherModel.main!.tempMax! ~/ 10}',
                                                style: textStyle3(),
                                              ),
                                              Text(
                                                "°C",
                                                style: textStyle3(),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                "↓",
                                                style: textStyle2(),
                                              ),
                                              Text(
                                                '${weatherModel.main!.tempMin! ~/ 10}',
                                                style: textStyle3(),
                                              ),
                                              Text(
                                                "°C",
                                                style: textStyle3(),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              CardWidget(
                                height: 150.0,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sunrise : $sunRise',
                                      style: textStyle1(),
                                    ),
                                    Text(
                                      'Sunset : $sunSet',
                                      style: textStyle1(),
                                    ),
                                  ],
                                ),
                              ),
                              CardWidget(
                                height: 250.0,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        ExpandedWidget(
                                            titleText: 'Pressure',
                                            subTitleText:
                                                "${weatherModel.main!.pressure! ~/ 34} \"Hg"),
                                        ExpandedWidget(
                                            titleText: 'Humidity',
                                            subTitleText:
                                                "${weatherModel.main!.humidity}%"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        ExpandedWidget(
                                            titleText: 'Wind',
                                            subTitleText:
                                                '${weatherModel.wind!.speed}km/h'),
                                        ExpandedWidget(
                                            titleText: 'Visibility',
                                            subTitleText:
                                                "${weatherModel.visibility! ~/ 1000} km")
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text('loading...'),
                ],
              ),
            );
          }
        },
      ),
    ));
  }
}
