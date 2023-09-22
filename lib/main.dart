// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, sort_child_properties_last, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() => runApp(WheaterApp());

/*
  https://api.weatherapi.com
  
  /v1/forecast.json
  
  ?key=81134a81c96740db958105843232808&q=-20.8,-49.38
*/

class WheaterApp extends StatelessWidget {
  var queryParams = {
    'key': 'f62377c9fa074792b5f185658232209',
    'q': '-20.8,-49.38',
    'lang': 'pt',
  };

  Future<Map<String, dynamic>?> loadWeatherData() async {
    var url = Uri.https('api.weatherapi.com', '/v1/forecast.json', queryParams);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body) as Map<String, dynamic>;
      return json;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff255AF4),
        body: FutureBuilder<Map<String, dynamic>?>(
            future: loadWeatherData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }

              var dados = snapshot.data;
              var forecastday =
                  dados?['forecast']['forecastday'][0]['hour'] as List<dynamic>;

              return SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(dados?['location']['name'], style: titleStyle),
                    Container(
                      height: 234,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Image.network(
                                '${dados?['current']['condition']['icon']}'),
                            width: 96,
                            height: 96,
                          ),
                          Text(dados?['current']['condition']['text'],
                              style: titleStyle),
                          Text("${dados!['current']['temp_c']}°C",
                              style: degreeStyle33),
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
                              Image.asset(
                                'images/humidity.png',
                                height: 30,
                                width: 30,
                              ),
                              Text("HUMIDITY", style: textTemperatureStyle),
                              Text("${dados['current']['humidity']}%",
                                  style: textTemperatureStyle),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'images/wind.png',
                                height: 30,
                                width: 30,
                              ),
                              Text("WIND", style: textTemperatureStyle),
                              Text("${dados['current']['wind_kph']}Km/h",
                                  style: textTemperatureStyle),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'images/feels_like.png',
                                height: 30,
                                width: 30,
                              ),
                              Text("FEELS LIKE", style: textTemperatureStyle),
                              Text("${dados['current']['feelslike_c']}°",
                                  style: textTemperatureStyle),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: forecastday
                            .map(
                              (item) => ForecastDay(
                                item['time_epoch'],
                                'ensolaradokkk',
                                item['temp_c'],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class ForecastDay extends StatelessWidget {
  int timeEpoch;
  String image;
  double temperature;
  String? hour;

  ForecastDay(this.timeEpoch, this.image, this.temperature) {
    var data = DateTime.fromMillisecondsSinceEpoch(timeEpoch);
    hour = data.hour.toString();
  }

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
                hour!,
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
