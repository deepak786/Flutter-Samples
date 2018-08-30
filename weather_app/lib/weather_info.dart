import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'choose_location.dart';
import 'constants.dart';
import 'customPath.dart';

class WeatherInfo extends StatefulWidget {
  @override
  _WeatherInfoState createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  var query = default_city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SafeArea(
        child: Column(
          children: <Widget>[
            getTopBanner(context),
            getWeatherWidget(),
          ],
        ),
      ),
    );
  }

  Future<Map> getWeatherData(String query) async {
    String url = open_weather_url + query;

    http.Response response = await http.get(url);
    return json.decode(response.body);
  }

  Widget getTopBanner(BuildContext context) {
    var now = new DateTime.now();
    var minute = now.minute;
    Color backgroundColor;
    Color textColor;

    if (minute % 3 == 0) {
      backgroundColor = const Color(0xFF292767);
      textColor = const Color(0xFFF7A566);
    } else {
      textColor = const Color(0xFF292767);
      backgroundColor = const Color(0xFFF7A566);
    }

    return Expanded(
      flex: 1,
      child: ClipPath(
          clipper: CustomPath(),
          child: Container(
            width: double.infinity,
            color: backgroundColor,
            child: Stack(
              children: <Widget>[
                Container(
                  child: Center(
                    child: Text(
                      "Weather Info",
                      style: TextStyle(
                        fontSize: 40.0,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      openSettings(context);
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }

  FutureBuilder<Map> getWeatherWidget() {
    int flex = 1;
    return FutureBuilder<Map>(
      future: getWeatherData(query),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data;

          return new Expanded(
            flex: flex,
//            child: Center(
            child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data['name'],
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 25.0),
                ),
                Text(
                  getWeatherTime(data['dt']),
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 12.0),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Text(
                  "${data['main']['temp']} C",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.network(
                  "http://openweathermap.org/img/w/${data['weather'][0]['icon']}.png",
                ),
                Text(
                  data['weather'][0]['description'],
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 25.0),
                ),
              ],
//              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Expanded(
            flex: flex,
            child: Text(
              snapshot.error.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
          );
        } else {
          return Expanded(
            flex: flex,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  String getWeatherTime(int dt) {
    var date = new DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    return date.toIso8601String();
  }

  Future openSettings(BuildContext context) async {
    Map map = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => SelectCity()));
    if (map != null && map.containsKey("city")) {
      setState(() {
        query = map['city'];
      });
    }
  }
}
