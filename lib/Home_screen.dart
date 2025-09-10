import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Helper/weather_service.dart';
import 'package:weather_app/Manger/weather_cubit.dart';
import 'package:weather_app/Manger/weather_state.dart';
import 'package:weather_app/weather_screen.dart';
import 'SearchScreen.dart';
import 'no_weather.dart';
import 'package:weather_app/weather_model.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Weather App"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is NoWeatherBody) {
            return
              NoWeatherBody();
          } else if (state is WeatherLoaded) {
            return WeatherScreen(weatherModel: state.weatherModel);
          }

        else {
            return NoWeatherBody();
          }
        },
      ),
    );
  }
}
