import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_weather_forecast/elements/weather_info_card.dart';
import 'package:flutter_weather_forecast/fetch_weather.dart';

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
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[300],
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
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'Kharkiv',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_vert,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/static/clear-day.svg',
                      height: MediaQuery.of(context).size.height / 4.5,
                      width: MediaQuery.of(context).size.height / 4.5,
                    ),
                    /*Icon(
                      Icons.sunny,
                      size: MediaQuery.of(context).size.height / 4.5,
                      color: Colors.amber,
                    ),*/
                    const SizedBox(height: 10),
                    Text(
                      '${weekdayName[currentDate.weekday]} | ${monthName[currentDate.month]} ${currentDate.day}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                      ),
                    ),
                    Text(
                      '24',
                      style: TextStyle(
                        //fontSize: 60,
                        fontSize: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Sunny',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.03,
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        WeatherInfoCard(
                          icon: Icons.wind_power,
                          text1: '3.7 km/h',
                          text2: 'Wind',
                        ),
                        WeatherInfoCard(
                          icon: Icons.cloud_download,
                          text1: '74%',
                          text2: 'Chance of rain',
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        WeatherInfoCard(
                          icon: Icons.thermostat,
                          text1: '1010 mbar',
                          text2: 'Pressure',
                        ),
                        WeatherInfoCard(
                          icon: Icons.water_drop_outlined,
                          text1: '83%',
                          text2: 'Humidity 83%',
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Container(
              height: 150,
              color: Colors.blue[300],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 5),
                    child: Text(
                      '${weekdayName[currentDate.weekday]} | ${monthName[currentDate.month]} ${currentDate.day}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 23,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          height: 60,
                          child: Column(
                            children: [
                              Text(
                                "10:00",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(Icons.sunny)
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
