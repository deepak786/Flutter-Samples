import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class QuakeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuakeListState();
  }
}

class QuakeListState extends State<QuakeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quakes'),
          centerTitle: true,
          backgroundColor: Theme.of(context).accentColor,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
          child: FutureBuilder<Map>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.containsKey("features")) {
                  List list = List.of(snapshot.data['features']);
                  return ListView.builder(
                      padding: EdgeInsets.all(10.0),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return getListItem(context, list[index]);
                      });
                } else {
                  return Text("No Data Found");
                }
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ));
  }

  /// get the list item to show the data
  Widget getListItem(BuildContext context, data) {
    return ListTile(
      title: Text(
        getDate(data['properties']['time']),
        style: TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 16.0,
            color: Theme.of(context).accentColor),
      ),
      subtitle: Text(
        data['properties']['place'],
        style: TextStyle(
            fontStyle: FontStyle.italic, fontSize: 14.0, color: Colors.grey),
      ),
      contentPadding: EdgeInsets.all(10.0),
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        child: Text(
          data['properties']['mag'].toString(),
          style: TextStyle(
              fontStyle: FontStyle.normal, fontSize: 14.0, color: Colors.white),
        ),
      ),
      onTap: () {
        openDialog(context, data);
      },
    );
  }

  /// get the human readable dat from milliseconds using the library intl.dart
  String getDate(millis) {
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(millis);
    var format = new DateFormat("MMM dd, yyyy hh:mm a");
    return format.format(date);
  }

  /// open the dialog whe user clicks on list item
  openDialog(BuildContext context, data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quakes'),
          content: Text(data['properties']['title']),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            )
          ],
        );
      },
      barrierDismissible: false,
    );
  }
}

/// get the data from url
Future<Map> getData() async {
  String url =
      "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";

  http.Response response = await http.get(url);

  return json.decode(response.body);
}
