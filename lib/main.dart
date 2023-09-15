// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';

void main() => runApp(WheaterApp());

//Variavéis de estilo
const titleStyle = TextStyle(color: Colors.white, fontSize: 36);

const degreeStyle33 = TextStyle(
  color: Colors.white,
  fontSize: 64,
  fontWeight: FontWeight.w500,
  shadows: [
    Shadow(
      color: Color.fromRGBO(0, 0, 0, 0.25),
      offset: Offset(4, 4),
      blurRadius: 2)
  ]
);

const textTemperatureStyle = TextStyle(
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.w500,
  shadows: [
    Shadow(
      color: Color.fromRGBO(0, 0, 0, 0.25),
      offset: Offset(4, 4),
      blurRadius: 2),
   ],
);

const bottomTextStyle = TextStyle(
  fontWeight: FontWeight.w500, 
  fontSize: 20, 
  color: Colors.white
);

const topTextStyle = TextStyle(
  fontSize: 16, 
  color: Colors.white
);

//Classe WeatherApp
class WheaterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color(0xff255AF4),
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  Text("São José do Rio Preto", style: titleStyle),
                  
                  Container(
                    child: Image.asset('images/01_sunny_color.png'),
                    width: 96,
                    height: 96,
                    margin: EdgeInsets.fromLTRB(0, 53, 0, 24),
                  ),
                  
                  Text("Ensolarado", style: titleStyle),
                  Text("33°", style: degreeStyle33),
                  
                  Container(
                    margin: EdgeInsets.only(top: 71),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: <Widget>[
                            Image.asset('images/humidity.png', height: 30),
                            Text("HUMIDITY", style: textTemperatureStyle),
                            Text("52%", style: textTemperatureStyle),
                          ],
                        ),
                        
                        Column(
                          children: <Widget>[
                            Image.asset('images/wind.png', height: 30),
                            Text("WIND", style: textTemperatureStyle),
                            Text("19km/h", style: textTemperatureStyle),
                          ],
                        ),
                        
                        Column(
                          children: <Widget>[
                            Image.asset('images/feels_like.png', height: 30),
                            Text("FEELS LIKE", style: textTemperatureStyle ),
                            Text("24°", style: textTemperatureStyle),
                          ],
                        ),
                      ],
                    ),
                  ),
                
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 98),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text("Now", style: topTextStyle,),
                            Image.asset('images/03_cloud_color.png', height: 36, width: 36,),
                            Text("18°", style: bottomTextStyle,),
                          ],
                        ),

                        Column(
                          children: [
                            Text("10AM", style: topTextStyle,),
                            Image.asset('images/hot_wind.png', height: 36, width: 36,),
                            Text("19°", style: bottomTextStyle,),
                          ],
                        ),
                        
                        Column(
                          children: [
                            Text("11AM", style: topTextStyle,),
                            Image.asset('images/04_sun_cloudy_color.png', height: 36, width: 36,),
                            Text("22°", style: bottomTextStyle,),
                          ],
                        ),

                        Column(
                          children: [
                            Text("12AM", style: topTextStyle,),
                            Image.asset('images/01_sunny_color.png', height: 36, width: 36,),
                            Text("23°", style: bottomTextStyle,),
                          ],
                        ),
                        
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1PM", style: topTextStyle,),
                            Image.asset('images/11_heavy_rain_color.png', height: 36),
                            Text("24°", style: bottomTextStyle,),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
