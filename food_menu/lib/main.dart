import 'package:flutter/material.dart';

import 'item.dart';
import 'menu_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Item> cartItems;
  double totalPrice = 0;
  // why we need this navigationKey?
  // because dialogs must be shown from the navigator screen not from the main screen
  // see the thread https://stackoverflow.com/questions/53294551/showdialog-from-root-widget
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    cartItems = List();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.yellow,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("F&B"),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "COMBOS",
                ),
                Tab(
                  text: "DRINKS",
                ),
                Tab(
                  text: "CREPES",
                ),
              ],
            ),
          ),
          backgroundColor: Colors.black,
          body: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: TabBarView(
                  children: [
                    MenuList(
                      menuItemAction: onMenuItemAction,
                    ),
                    MenuList(
                      menuItemAction: onMenuItemAction,
                    ),
                    MenuList(
                      menuItemAction: onMenuItemAction,
                    ),
                  ],
                ),
              ),
              getTotalPriceView(false, viewCart),
            ],
          ),
        ),
      ),
    );
  }

  /// get total price view
  Widget getTotalPriceView(bool isExpanded, Function action) {
    return Container(
      color: Colors.yellow,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: action,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "AED " + totalPrice.toStringAsFixed(2),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print("PAY clicked");
              },
              child: Row(
                children: <Widget>[
                  Text(
                    "PAY",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// view cart
  void viewCart() {
    if (totalPrice > 0) {
      final context = navigatorKey.currentState.overlay.context;
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.yellow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "F&B Summary",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    itemCount: cartItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              cartItems[index].title +
                                  " (" +
                                  cartItems[index].cartCount.toString() +
                                  ")",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              (cartItems[index].price *
                                      cartItems[index].cartCount)
                                  .toStringAsFixed(2),
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                getTotalPriceView(true, () {
                  Navigator.maybePop(context);
                }),
              ],
            ),
          );
        },
      );
    }
  }

  /// this is the callback function which wil be called when item is added or removed from cart
  /// item -> Item details
  /// type -> true = item added or quantity increased, 1 = item removed or quantity decreased
  void onMenuItemAction(Item item, bool type) {
    if (type) {
      // item is added with quantity 1 or quantity has increased
      // increase the total price
      totalPrice += item.price;
      if (item.cartCount == 1) {
        // add this item to the list
        cartItems.add(item);
      }
    } else {
      // item quantity is decreased
      // decrease the total price
      totalPrice -= item.price;
      if (item.cartCount == 0) {
        // item is removed from the cart
        cartItems.remove(item);
      }
    }

    // update the state
    setState(() {});
  }
}
