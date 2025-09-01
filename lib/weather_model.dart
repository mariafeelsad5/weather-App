import 'package:flutter/cupertino.dart';

class WeatherModel {

 String nameCity;
 String lastdate;
 double temp;
 double maxtemp;
 double mintemp;
 String WeatherCondition;
 String image;


WeatherModel({required this.nameCity,
  required this.lastdate,
  required this.temp,
  required this.maxtemp,
  required this.mintemp,
  required this.WeatherCondition,
  required this.image,});


factory WeatherModel.fromjson(json){

  return WeatherModel(nameCity: json["location"]["name"],
      lastdate:  json["location"]["localtime"],
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maxtemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      mintemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      WeatherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
      image:  json["forecast"]["forecastday"][0]["day"]["condition"]["icon"]
  );

}

}