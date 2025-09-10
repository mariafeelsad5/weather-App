import 'package:dio/dio.dart';
import 'package:weather_app/weather_model.dart';

class WeatherService
{
late WeatherModel weatherModel;
Dio dio = Dio();
String baseUrl = "http://api.weatherapi.com/v1";
  String apikey = "ce2dca28638e47bd80372826250109";



  getData  ({required String cityName})  async {
    Response r = await dio.get(

        "${baseUrl}/forecast.json?key=${apikey}&q=${cityName}&days=7&aqi=no&alerts=no"
    );
    weatherModel = WeatherModel.fromJson(r.data);
    return weatherModel;
  }
String getWeatherBackground(String condition) {
  condition = condition.toLowerCase();
  if (condition.contains('sunny')) {
    return 'assets/image a/beautiful sunny day --ar 2_3.jpeg';
  } else if (condition.contains('rain')) {
    return 'assets/image a/5b82d580-d186-4b1b-9a31-b4de3d8d6ea9.jpeg';
  } else if (condition.contains('cloud')) {
    return 'assets/image a/cloudy wather.jpeg';
  } else if (condition.contains('mist')) {
    return 'assets/image a/Foggy morning.jpeg';
  }

  // fallback لأي حالة غير متوقعة
  return 'assets/images/cloudy.jpeg';
}}
