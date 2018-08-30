import 'package:flutter/material.dart';

class SelectCity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = getCities();
    return Scaffold(
      appBar: AppBar(
        title: Text("Select City"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, position) {
          return ListTile(
            onTap: () {
              passCity(context, data[position]);
            },
            title: Text(
              data[position],
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          );
        },
      ),
    );
  }

  List<String> getCities() {
    List<String> cities = new List<String>();
    cities.add("Bangkok");
    cities.add("London");
    cities.add("Paris");
    cities.add("Dubai");
    cities.add("New York");
    cities.add("Singapore");
    cities.add("Kuala Lumpur");
    cities.add("Istanbul");
    cities.add("Tokyo");
    cities.add("Seoul");
    cities.add("Hong Kong");
    cities.add("Barcelona");
    cities.add("Amsterdam");
    cities.add("Milan");
    cities.add("Taipei");
    cities.add("Rome");
    cities.add("Osaka");
    cities.add("Vienna");
    cities.add("Shanghai");
    cities.add("Prague");
    cities.add("Los Angeles");
    cities.add("Madrid");
    cities.add("Munich");
    cities.add("Miami");
    cities.add("Dublin");

    return cities;
  }

  void passCity(BuildContext context, String city) {
    Navigator.pop(context, {
      'city': city,
    });
  }
}
