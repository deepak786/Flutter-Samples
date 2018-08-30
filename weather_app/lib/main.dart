import 'package:flutter/material.dart';

import 'weather_info.dart';

void main() => runApp(
      new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: WeatherInfo(),
        theme: ThemeData(
          primaryColor: const Color(0xFF292767),
          accentColor: const Color(0xFF292767)
        ),
      ),
    );
