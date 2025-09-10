import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/first_screen.dart';
class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        elevation: 0,
        title: const Text("Weather App"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchAndNoWeatherScreen(),
                ),
              );
            },
          ),
        ],
      ),

      body: Center(
        child: Text(
          "No weather here 😥🔍",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}