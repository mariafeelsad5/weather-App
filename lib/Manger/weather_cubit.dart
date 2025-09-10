
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Helper/weather_service.dart';
import 'package:weather_app/Manger/weather_state.dart';
import 'package:weather_app/first_screen.dart';


class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());


   getWeather({required String city}) async {
    try {
      emit(WeatherLoading());

      final weather = await WeatherService().getData(cityName: city);

      emit(WeatherLoaded(weatherModel: weather));
    } catch (e) {
      emit(WeatherError());
    }
  }}
