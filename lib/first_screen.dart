import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Manger/weather_cubit.dart';
import 'package:weather_app/Manger/weather_state.dart';
import 'package:weather_app/no_weather.dart';
import 'package:weather_app/weather_screen.dart';

class SearchAndNoWeatherScreen extends StatelessWidget {
  const SearchAndNoWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        title: const Text("Weather App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onFieldSubmitted: (value) {
                context.read<WeatherCubit>().getWeather(city: value);
              },
              cursorColor: Colors.pink.shade100,
              decoration: InputDecoration(
                labelText: "City Name",
                prefix: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.location_city,
                    color: Colors.pink.shade200,
                  ),
                ),
                border: const OutlineInputBorder(),
              ),
            ),

            // هنا بنستخدم BlocListener عشان نتابع تغير الحالة وننتقل بين الصفحات
            BlocListener<WeatherCubit, WeatherState>(
              listener: (context, state) {
                if (state is WeatherLoaded) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WeatherScreen(weatherModel: state.weatherModel),
                    ),
                  );
                } else if (state is WeatherError) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const NoWeatherBody(),
                    ),
                  );
                }
              },
              child: BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.pink,
                      ),
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}

