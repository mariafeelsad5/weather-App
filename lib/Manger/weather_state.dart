
import 'package:weather_app/weather_model.dart';

abstract class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherLoaded extends WeatherState {
  final WeatherModel weatherModel;
  WeatherLoaded({required this.weatherModel});
}

final class WeatherError extends WeatherState {}
