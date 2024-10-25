import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/elements/city_plate.dart';

class ManageLocationScreen extends StatelessWidget {
  const ManageLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Manage location',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              //Search your city
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 10),
                    const Icon(Icons.search),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Search your city',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(bottom: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
              //Cities panels
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return const CityPlate(
                      cityName: 'Malang',
                      dayTemp: '20°',
                      nightTemp: '24°',
                      currentCity: true,
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
