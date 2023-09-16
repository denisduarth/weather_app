// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, sort_child_properties_last, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'style.dart';

void main() => runApp(WheaterApp());

//Classe WeatherApp
class WheaterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color(0xff255AF4),
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("São José do Rio Preto", style: titleStyle),
                  
                  Container(
                    height: 234,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Image.asset('images/01_sunny_color.png'),
                          width: 96,
                          height: 96,
                        ),
                        Text("Ensolarado", style: titleStyle),
                        Text("33°", style: degreeStyle33),
                      ],
                    ),
                  ),
                  
                  Container(
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('images/humidity.png', height: 30, width: 30,),
                            Text("HUMIDITY", style: textTemperatureStyle),
                            Text("52%", style: textTemperatureStyle),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Image.asset('images/wind.png', height: 30, width: 30,),
                            Text("WIND", style: textTemperatureStyle),
                            Text("19km/h", style: textTemperatureStyle),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('images/feels_like.png', height: 30, width: 30,),
                            Text("FEELS LIKE", style: textTemperatureStyle),
                            Text("24°", style: textTemperatureStyle),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  Container(
                    height: 100,
                    child: Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ForecastDay('10AM', '03_cloud_color', 11.7),
                          ForecastDay('11AM', '04_sun_cloudy_color', 17),
                          ForecastDay('Now', '01_sunny_color', 33),
                          ForecastDay('1PM', '04_sun_cloudy_color', 23.4),
                          ForecastDay('2PM', '11_heavy_rain_color', 18),
                          ForecastDay('3PM', '03_cloud_color', 15),
                          ForecastDay('Now', '03_cloud_color', 11.7),
                          ForecastDay('Now', '03_cloud_color', 11.7),
                          ForecastDay('Now', '03_cloud_color', 11.7),
                          ForecastDay('Now', '03_cloud_color', 11.7),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}

class ForecastDay extends StatelessWidget {
  String hour;
  String image;
  double temperature;

  ForecastDay(this.hour, this.image, this.temperature);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      margin: EdgeInsets.only(left: 39),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                hour,
                style: topTextStyle,
              ),
              Image.asset(
                'images/$image.png',
                height: 36,
                width: 36,
              ),
              Text(
                '$temperature°',
                style: bottomTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
