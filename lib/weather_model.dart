import 'package:flutter/cupertino.dart';
class ForecastDay {
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String condition;
  final String image;

  ForecastDay({
    required this.temp,
    required this.maxtemp,
    required this.mintemp,
    required this.condition,
    required this.image,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      temp: json["day"]["avgtemp_c"],
      maxtemp: json["day"]["maxtemp_c"],
      mintemp: json["day"]["mintemp_c"],
      condition: json["day"]["condition"]["text"],
      image: json["day"]["condition"]["icon"],
    );
  }
}

class WeatherModel {

 String nameCity;
 String lastdate;
 double temp;
 double maxtemp;
 double mintemp;
 String WeatherCondition;
 String image;
 List <ForecastDay> forecastDays;

WeatherModel({required this.nameCity,
  required this.lastdate,
  required this.temp,
  required this.maxtemp,
  required this.mintemp,
  required this.WeatherCondition,
  required this.image,
  required this.forecastDays,});


 factory WeatherModel.fromJson(Map<String, dynamic> json) {
   List<dynamic> forecastJson = json["forecast"]["forecastday"];

   List<ForecastDay> forecastList = forecastJson.map<ForecastDay>((dayJson) {
     return ForecastDay.fromJson(dayJson);
   }).toList();

   return WeatherModel(
     nameCity: json["location"]["name"],
     lastdate: json["location"]["localtime"],
     temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
     maxtemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
     mintemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
     WeatherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
     image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
     forecastDays: forecastList,
   );
 }}
