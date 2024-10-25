import 'package:flutter/material.dart';

import '../weather_icon.dart';

class CityPlate extends StatelessWidget {
  final String cityName;
  final String dayTemp;
  final String nightTemp;
  final bool currentCity;

  const CityPlate({
    super.key,
    required this.cityName,
    required this.dayTemp,
    required this.nightTemp,
    required this.currentCity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 80,
      margin: const EdgeInsets.only(top: 15),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      cityName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    currentCity
                        ? const Icon(Icons.location_on_outlined)
                        : Container(),
                  ],
                ),
                Text('$dayTemp/$nightTemp'),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WeatherIcon(
                  main: 'Rain',
                  iconSize: 25,
                ),
                SizedBox(height: 5,),
                Text('Heavy rain'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
