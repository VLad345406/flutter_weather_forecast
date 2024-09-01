import 'package:http/http.dart' as http;
import 'dart:convert';

import 'city_weather.dart';

class WeatherModel {
  static const baseUrl = 'https://api.openweathermap.org/data/2.5/forecast';
  final String apiKey;

  WeatherModel(this.apiKey);

  Future<CityWeather> getWeather(String cityName) async {
    final response = await http
        .get(
            Uri.parse('$baseUrl?q=$cityName&cnt=8&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return CityWeather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
