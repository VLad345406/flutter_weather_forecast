import 'package:flutter/material.dart';

class WeatherInfoCard extends StatelessWidget {
  final IconData icon;
  final String text1;
  final String text2;

  const WeatherInfoCard({
    super.key,
    required this.icon,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 35,
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            Text(
              text2,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
