import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

//select necessary icon
//documentation about weather type in API:
//https://openweathermap.org/weather-conditions

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({super.key, required this.main, required this.iconSize});

  final String main;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    IconData? icon;
    DateTime now = DateTime.now();
    switch (main) {
      case 'Thunderstorm':
        icon = WeatherIcons.thunderstorm;
        break;
      case 'Rain':
        icon = WeatherIcons.rain;
        break;
      case 'Drizzle':
        icon = WeatherIcons.raindrop;
        break;
      case 'Snow':
        icon = WeatherIcons.snow;
        break;
      case 'Mist':
        icon = WeatherIcons.fog;
        break;
      case 'Smoke':
        icon = WeatherIcons.fog;
        break;
      case 'Haze':
        icon = WeatherIcons.fog;
        break;
      case 'Dust':
        icon = WeatherIcons.dust;
        break;
      case 'Fog':
        icon = WeatherIcons.fog;
        break;
      case 'Sand':
        icon = WeatherIcons.sandstorm;
        break;
      case 'Ash':
        icon = WeatherIcons.volcano;
        break;
      case 'Squall':
        icon = WeatherIcons.cloudy_windy;
        break;
      case 'Tornado':
        icon = WeatherIcons.tornado;
        break;
      case 'Clear':
        if (now.hour >= 7 && now.hour < 19) {
          icon = WeatherIcons.day_sunny;
        }
        else {
          icon = WeatherIcons.moon_alt_full;
        }
        break;
      case 'Clouds':
        icon = WeatherIcons.cloud;
        break;
    }
    return Icon(
      icon,
      color: Colors.white,
      size: iconSize,
    );
  }
}
