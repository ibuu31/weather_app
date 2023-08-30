import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/client_api.dart';
import 'package:weather_app/weather_model.dart';

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
                              Card(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18))),
                                elevation: 20,
                                // shadowColor: Colors.black,
                                color: Colors.white.withAlpha(90),
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 300,
                                  width: MediaQuery.of(context).size.width - 20,
                                  child: Padding(
                                    padding: const EdgeInsets.all(21.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          weatherModel.name.toString(),
                                          style: const TextStyle(
                                            fontSize: 35,
                                          ),
                                        ),
                                        Text(
                                          currentDate.toString(),
                                          style: const TextStyle(fontSize: 22),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, bottom: 5),
                                              child: Text(
                                                ' ${(weatherModel.main!.temp! ~/ 10)}°C',
                                                style: const TextStyle(
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, bottom: 5),
                                              child: Text(
                                                weatherModel.weather![0].main
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  "↑",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '${weatherModel.main!.tempMax! ~/ 10}',
                                                  style: const TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const Text(
                                                  "°C",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                const Text(
                                                  "↓",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '${weatherModel.main!.tempMin! ~/ 10}',
                                                  style: const TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const Text(
                                                  "°C",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18))),
                                elevation: 20,
                                // shadowColor: Colors.black,
                                color: Colors.white.withAlpha(90),
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 150,
                                  width: MediaQuery.of(context).size.width - 20,
                                  child: Padding(
                                    padding: const EdgeInsets.all(21.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Sunrise : $sunRise',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Sunset : $sunSet',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18))),
                                elevation: 20,
                                // shadowColor: Colors.black,
                                color: Colors.white.withAlpha(90),
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 250,
                                  width: MediaQuery.of(context).size.width - 20,
                                  child: Padding(
                                    padding: const EdgeInsets.all(21.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: ListTile(
                                                title: const Text(
                                                  'Pressure',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle: Text(
                                                  "${weatherModel.main!.pressure! ~/ 34} \"Hg"
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: ListTile(
                                                title: const Text(
                                                  'Humidity',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle: Text(
                                                  "${weatherModel.main!.humidity}%"
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: ListTile(
                                                title: const Text(
                                                  'Wind',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle: Text(
                                                  '${weatherModel.wind!.speed}km/h'
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: ListTile(
                                                title: const Text(
                                                  'Visibility',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle: Text(
                                                  "${weatherModel.visibility! ~/ 1000} km"
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
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
