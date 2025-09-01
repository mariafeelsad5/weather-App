import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/weather_model.dart';

class WeatherScreen extends StatefulWidget {
   WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
WeatherModel? weatherModel;
bool isloading = true;
  Dio dio = Dio();
@override
  void initState() {
    super.initState();
    getHttp();
  }
   getHttp()  async{
    Response response =await dio.get("http://api.weatherapi.com/v1/forecast.json?key=ce2dca28638e47bd80372826250109&q=london&days=1&aqi=no&alerts=no");
   setState(() {
     weatherModel = WeatherModel.fromjson(response.data);
     isloading =false;
   });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Weather App"),
        centerTitle: true,
      ),
      body: isloading? Center(child: CircularProgressIndicator()): Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${weatherModel!.nameCity}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'updated at ${weatherModel!.lastdate}',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  "https:${weatherModel!.image}",
                  height: 100,
                ),
                Text(
                  '${weatherModel!.temp}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Maxtemp: ${weatherModel!.maxtemp}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mintemp: ${weatherModel!.mintemp}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              '${weatherModel!.WeatherCondition}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
