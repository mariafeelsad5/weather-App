import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Manger/weather_cubit.dart';
class SearchScreen extends StatelessWidget{

  const SearchScreen({super.key});

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

  },
  icon: Icon(Icons.search),
  ),
  ],
  ),
  body: Padding(
  padding: const EdgeInsets.all(10.0),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  TextFormField(
    onFieldSubmitted: (value){
      context.read<WeatherCubit>().getWeather(city:value);
      Navigator.pop(context);
    },cursorColor: Colors.pink.shade100,
  decoration:  InputDecoration(
  labelText: "City Name",
  prefix: Padding(
  padding: const EdgeInsets.only(right: 8),
  child: Icon(Icons.location_city,color: Colors.pink.shade200,),
  ),
  border: OutlineInputBorder(),
  ),
  ),
  ],
  ),
  ),
  );
  }
  }
