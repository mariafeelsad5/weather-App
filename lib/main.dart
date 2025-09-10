import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Home_screen.dart';
import 'package:weather_app/Manger/weather_cubit.dart';
import 'package:weather_app/weather_model.dart';
import 'weather_screen.dart';
import 'package:weather_app/first_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit>(
      create: (context) => WeatherCubit(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SearchAndNoWeatherScreen(),
      ),
    );
  }
}

