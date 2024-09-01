import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lb2/weather_icon.dart';
import 'package:weather_icons/weather_icons.dart';

import 'fetch_weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _fetchWeather() async {
    String cityName = 'kharkiv';

    try {
      final getWeather = await weatherModel.getWeather(cityName);
      setState(() {
        weather = getWeather;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      backgroundColor: Colors.redAccent,
      title: const Text(
        'Weather Forecast',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
      elevation: 0,
    );
    if (weather!.cityName.isEmpty) {
      return Scaffold(
        appBar: appBar,
        backgroundColor: Colors.redAccent,
        body: const Center(
          child: Text(
            'Loading...',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: appBar,
        backgroundColor: Colors.redAccent,
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Center(
            child: ListView(
              primary: false,
              shrinkWrap: true,
              children: [
                //city search
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter City Name',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                //city detail
                Column(
                  children: [
                    //city
                    Text(
                      weather!.cityName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 30),
                    ),
                    //current day
                    Text(
                      DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                //temperature detail
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WeatherIcon(
                      main: weather!.weather[0].mainCondition,
                      iconSize: 100,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text(
                          '${weather?.weather[0].temperature.round()}°C',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 60,
                              fontWeight: FontWeight.w200),
                        ),
                        Text(
                          '${weather?.weather[0].mainCondition}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 15),
                //extra weather detail
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.wind_power,
                            color: Colors.white,
                            size: 50,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${weather?.weather[0].windSpeed} km/hr',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            WeatherIcons.humidity,
                            color: Colors.white,
                            size: 50,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            '${weather?.weather[0].humidity}%',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Weather forecast for specific hours",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontSize: 25),
                ),
                const SizedBox(height: 15),
                //our weather forecast
                SizedBox(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: weather!.weather.length - 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Container(
                            color: Colors.red,
                            width: 200,
                            height: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${weather!.weather[index + 1].hour} o'clock",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${weather!.weather[index + 1].temperature.round()} °C',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    WeatherIcon(
                                      main: weather!.weather[index + 1].mainCondition,
                                      iconSize: 30,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          index < 6
                              ? const SizedBox(
                                  width: 10,
                                )
                              : const SizedBox(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
