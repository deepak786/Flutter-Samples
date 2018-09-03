import 'package:flutter/material.dart';

import 'offer.dart';
import 'offer_clipper.dart';

const Color titleColor = Color(0xFF443B55);

class Offers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Offer> list = getData();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: titleColor,
        title: Text("Offers"),
      ),
      backgroundColor: titleColor,
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          Offer offer = list[index];
          String image;
          if (offer.type == 0) {
            // pizza
            image = "images/pizza.png";
          } else if (offer.type == 1) {
            // mcd
            image = "images/mcd.jpeg";
          } else {
            // domino
            image = "images/burger.png";
          }
          return new Container(
            child: new ClipPath(
              clipper: OfferClipper(),
              child: new Container(
                margin: EdgeInsets.only(bottom: 5.0, top: 5.0, right: 10.0, left: 10.0),
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    offer.name,
                    style: TextStyle(
                      color: titleColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    offer.time,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                    ),
                  ),
                  trailing: Text(
                    offer.price,
                    style: TextStyle(
                      color: titleColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Image.asset(
                    image,
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Offer> getData() {
    List<Offer> data = new List();
    for (var i = 1; i <= 21; i++) {
      String name;
      String price;
      String time;
      var type;
      if (i % 3 == 0) {
        // pizza
        name = "Pizza Hut";
        price = "\$20";
        time = "Sep 3 to Sep 10";
        type = 0;
      } else if (i % 3 == 1) {
        // mc'd
        name = "McDonald's";
        price = "\$10";
        time = "Sep 3 to Sep 10";
        type = 1;
      } else {
        // domino
        name = "Dominos";
        price = "\$50";
        time = "Sep 3 to Sep 10";
        type = 2;
      }
      Offer offer = new Offer(name, price, time, type);
      data.add(offer);
    }
    return data;
  }
}
