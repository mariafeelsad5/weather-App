import 'dart:convert';
import 'package:weather_app/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Helper/weather_service.dart';
import 'package:weather_app/weather_model.dart';

class WeatherScreen extends StatelessWidget {
  final WeatherModel weatherModel;

  const WeatherScreen({Key? key, required this.weatherModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundImage =
    WeatherService().getWeatherBackground(weatherModel.WeatherCondition ?? '');

    return Scaffold(appBar: AppBar(
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

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage ?? 'assets/images/cloudy.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.black.withOpacity(0.5),
              child: Column(
                children: [
                  // اسم المدينة
                  Text(
                    weatherModel.nameCity,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 50),
                  ),

                  const SizedBox(height: 4),

                  // وقت التحديث
                  Text(
                    ' ${weatherModel.lastdate}',
                    style: const TextStyle(color: Colors.white70, fontSize: 25),
                  ),

                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Image.network(
                        'https:${weatherModel.image}',
                        width: 60,
                        height: 60,
                        errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error, color: Colors.red),
                      ),

                      const SizedBox(height: 4),

                      // درجة الحرارة الكبيرة
                      Text(
                        '${weatherModel.temp.toStringAsFixed(1)}°C',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 48),
                      ),
                      const SizedBox(width: 20),

                      Column(
                        children: [
                          Text(
                            'Max: ${weatherModel.maxtemp.toStringAsFixed(1)}°C',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Min: ${weatherModel.mintemp.toStringAsFixed(1)}°C',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // الحالة الجوية
                  Text(
                    "${weatherModel.WeatherCondition}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: weatherModel.forecastDays.length,
                itemBuilder: (context, index) {
                  final day = weatherModel.forecastDays[index];
                  final date = DateTime.now().add(Duration(days: index));
                  final formattedDate = DateFormat('d MMM yyyy').format(date);

                  return Container(
                    width: 140, // زودت العرض شويه عشان المساحات الجديدة
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.pink.shade100.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('EEE').format(date), // اسم اليوم
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          formattedDate, // التاريخ الكامل زي 10 Sep 2025
                          style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),

                        const SizedBox(height: 6),

                        Image.network(
                          'https:${day.image}',
                          width: 60,
                          height: 60,
                          errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error, color: Colors.red),
                        ),

                        const SizedBox(height: 6),

                        Text('${day.temp.toStringAsFixed(1)}°C',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 30)),

                        Text('Max: ${day.maxtemp.toStringAsFixed(1)}°C',
                            style:
                            const TextStyle(color: Colors.white, fontSize: 18)),

                        Text('Min: ${day.mintemp.toStringAsFixed(1)}°C',
                            style:
                            const TextStyle(color: Colors.white, fontSize: 18)),

                        const SizedBox(height: 6),

                        // حالة الطقس النصية
                        Text(
                          day.condition,
                          style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
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
    );
  }
}
