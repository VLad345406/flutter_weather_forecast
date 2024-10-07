import 'package:flutter_weather_forecast/weather_structure.dart';
import 'package:intl/intl.dart';

class CityWeather {
  final String cityName;
  List<WeatherStructure> weather = [];

  CityWeather.clear({
    this.cityName = '',
  });

  CityWeather({
    required this.cityName,
    required this.weather,
  });

  factory CityWeather.fromJson(Map<String, dynamic> json) {
    List<WeatherStructure> weather = [];

    for (var item in json['list']) {
      DateTime date = DateTime.parse(item['dt_txt']);
      String hour = DateFormat.H().format(date);
      hour = hour.replaceAll(RegExp('^0'), '');

      weather.add(WeatherStructure(
        item['main']['temp'].toDouble(),
        item['weather'][0]['main'],
        item['wind']['speed'].toDouble(),
        item['main']['humidity'].toDouble(),
        hour,
      ));
    }

    return CityWeather(cityName: json['city']['name'], weather: weather);
  }
}
