import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_weather_forecast/elements/weather_info_card.dart';
import 'package:flutter_weather_forecast/fetch_weather.dart';
import 'package:flutter_weather_forecast/screens/manage_location_screen.dart';
import 'package:flutter_weather_forecast/screens/settings_screen.dart';
import 'package:flutter_weather_forecast/weather_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _fetchWeather() async {
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
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();

    const Map<int, String> weekdayName = {
      1: "Monday",
      2: "Tuesday",
      3: "Wednesday",
      4: "Thursday",
      5: "Friday",
      6: "Saturday",
      7: "Sunday"
    };
    const Map<int, String> monthName = {
      1: "Jan",
      2: "Feb",
      3: "Mar",
      4: "Apr",
      5: "May",
      6: "June",
      7: "July",
      8: "Aug",
      9: "Sep",
      10: "Oct",
      11: "Nov",
      12: "Dec",
    };

    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: _fetchWeather,
        child: weather!.cityName.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      decoration: BoxDecoration(
                        //color: Colors.blue[300],
                        gradient: LinearGradient(
                          colors: [Colors.blue[300]!, Colors.blue[800]!],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ManageLocationScreen(),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  weather!.cityName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SettingsScreen(),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.more_vert,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          WeatherIcon(
                            main: weather!.weather[0].mainCondition,
                            iconSize: 100,
                            color: Colors.white,
                          ),
                          /*SvgPicture.asset(
                      'assets/icons/static/clear-night.svg',
                      width: MediaQuery.of(context).size.height / 4.5,
                    ),*/
                          Text(
                            '${weekdayName[currentDate.weekday]} | ${monthName[currentDate.month]} ${currentDate.day}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                          ),
                          Text(
                            '${weather?.weather[0].temperature.round()}°C',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.1,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '${weather?.weather[0].mainCondition}',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.03,
                              color: Colors.white,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: Divider(
                              color: Colors.white,
                              thickness: 2,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              WeatherInfoCard(
                                icon: Icons.wind_power,
                                text1: '${weather?.weather[0].windSpeed} km/h',
                                text2: 'Wind',
                              ),
                              WeatherInfoCard(
                                icon: Icons.cloud_download,
                                text1: '74% (change)',
                                text2: 'Chance of rain',
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              WeatherInfoCard(
                                icon: Icons.thermostat,
                                text1: '1010 mbar (change)',
                                text2: 'Pressure',
                              ),
                              WeatherInfoCard(
                                icon: Icons.water_drop_outlined,
                                text1: '${weather?.weather[0].humidity}%',
                                text2: 'Humidity',
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 160,
                    color: Colors.blue[800],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 5),
                          child: Text(
                            '${weekdayName[currentDate.weekday]} | ${monthName[currentDate.month]} ${currentDate.day}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 7,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.all(10),
                                height: 60,
                                child: Column(
                                  children: [
                                    Text(
                                      "${weather!.weather[index].hour}:00",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    WeatherIcon(
                                      main: weather!
                                          .weather[index + 1].mainCondition,
                                      iconSize: 30,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '${weather!.weather[index + 1].temperature.round()} °C',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Text(
                                      '74% rain',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forecast for 7 days',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
