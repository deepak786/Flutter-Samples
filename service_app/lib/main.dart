import 'package:flutter/material.dart';
import 'toolbar.dart';
import 'service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: SafeArea(
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Toolbar(),
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.all(10.0),
                      children: <Widget>[
                        getServicesHeader(),
                        getServices(),
                        Padding(padding: EdgeInsets.all(10.0)),
                        seasonalServicesHeader(),
                        seasonalServices(),
                        Padding(padding: EdgeInsets.all(10.0)),
                        featuredServicesHeader(),
                        featuredServices(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  // services header
  Widget getServicesHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Services",
          style: getHeaderStyle(),
        ),
        Icon(
          Icons.arrow_drop_down,
          size: 30.0,
          color: Color(0XFFF79508),
        )
      ],
    );
  }

  // services
  Widget getServices() {
    List<Service> services = new List();
    services.add(Service("Accident", "images/ic_accident.png"));
    services.add(Service("Tires", "images/ic_tires.png"));
    services.add(Service("XYZ", "images/ic_xyz.png"));
    services.add(Service("Glass", "images/ic_glass.png"));
    services.add(Service("Oil", "images/ic_oil.png"));
    services.add(Service("Dash Lights", "images/ic_dash_light.png"));
    services.add(Service("Electric", "images/ic_electric.png"));
    services.add(Service("More", "images/ic_dotted.png"));

    return Container(
      padding: const EdgeInsets.all(3.0),
      decoration: new BoxDecoration(
        border: new BorderDirectional(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
          top: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        children: services.map((service) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                service.icon,
                width: 40.0,
                height: 40.0,
              ),
              Text(
                service.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                ),
                textAlign: TextAlign.center,
              )
            ],
          );
        }).toList(),
      ),
    );
  }

  // seasonal services header
  Widget seasonalServicesHeader() {
    return Text(
      "Seasonal Services",
      style: getHeaderStyle(),
    );
  }

  // seasonal services
  Widget seasonalServices() {
    return Container(
      height: 200.0,
      padding: const EdgeInsets.all(3.0),
      decoration: new BoxDecoration(
        border: new BorderDirectional(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: List.generate(10, (index) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              width: 200.0,
              height: 150.0,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                image: DecorationImage(
                  image: AssetImage("images/img.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text(""),
            ),
          );
        }),
      ),
    );
  }

  // featured services header
  Widget featuredServicesHeader() {
    return Text(
      "Featured Services",
      style: getHeaderStyle(),
    );
  }

  // featured services
  Widget featuredServices() {
    return Container(
      height: 150.0,
      padding: const EdgeInsets.all(3.0),
      decoration: new BoxDecoration(
        border: new BorderDirectional(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: List.generate(10, (index) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              width: 150.0,
              height: 100.0,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                image: DecorationImage(
                  image: AssetImage("images/img.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text(""),
            ),
          );
        }),
      ),
    );
  }

  // header style
  TextStyle getHeaderStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 16.0,
    );
  }
}
