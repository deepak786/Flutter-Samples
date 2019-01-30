import 'package:flutter/material.dart';

import 'item.dart';
import 'menu_item_size.dart';

class MenuItem extends StatefulWidget {
  final Item item;
  final double radius = 15;
  final Color borderColor = Colors.grey;
  final double borderWidth = 0.5;
  final String vegIcon =
      "https://www.motherskitchennepal.com/wp-content/uploads/2018/06/veg_icon.png";
  final String nonVegIcon =
      "https://www.motherskitchennepal.com/wp-content/uploads/2018/06/nonveg_icon.png";
  final Function menuItemAction;

  MenuItem(this.item, {this.menuItemAction});

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: getBorder(),
      ),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              // display the food image
              getFoodImage(),
              // check if food is veg or non veg
              vegOrNonVeg(),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                left: getBorderSide(),
                bottom: getBorderSide(),
                right: getBorderSide(),
              ),
            ),
            child: Column(
              children: <Widget>[
                itemSizeOptions(),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: titleAndPrice(),
                      ),
                      cartCount(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Border Radius only to top left and top right
  BorderRadiusGeometry getBorder() {
    return BorderRadius.only(
      topLeft: Radius.circular(widget.radius),
      topRight: Radius.circular(widget.radius),
    );
  }

  /// border side
  BorderSide getBorderSide() {
    return BorderSide(
      color: widget.borderColor,
      style: BorderStyle.solid,
      width: widget.borderWidth,
    );
  }

  /// food image
  Widget getFoodImage() {
    return ClipRRect(
      borderRadius: getBorder(),
      child: Image.network(
        widget.item.image,
        height: 170.0,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }

  /// food is veg or non veg
  Widget vegOrNonVeg() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Image.network(
          widget.item.isVeg ? widget.vegIcon : widget.nonVegIcon,
          width: 25.0,
          height: 25.0,
        ),
      ),
    );
  }

  /// title and price
  Widget titleAndPrice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.item.title,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
          ),
        ),
        Text(
          widget.item.getFormattedPrice(),
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  /// add to cart
  Widget cartCount() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: increment,
        ),
        Text(
          widget.item.cartCount.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.highlight_off,
            color: Colors.white,
          ),
          onPressed: decrement,
        ),
      ],
    );
  }

  /// increment count
  void increment() {
    setState(() {
      widget.item.cartCount++;
    });
    if (widget.menuItemAction != null) widget.menuItemAction(widget.item, true);
  }

  /// decrement count
  void decrement() {
    if (widget.item.cartCount > 0) {
      setState(() {
        widget.item.cartCount--;
      });
      if (widget.menuItemAction != null) widget.menuItemAction(widget.item, false);
    }
  }

  /// item size options
  Widget itemSizeOptions() {
    if (widget.item.cartCount > 0) {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            MenuItemSize("NORMAL", widget.item.size == 0, () {
              onSizeSelected(0);
            }),
            MenuItemSize("REGULAR", widget.item.size == 1, () {
              onSizeSelected(1);
            }),
            MenuItemSize("LARGE", widget.item.size == 2, () {
              onSizeSelected(2);
            }),
          ],
        ),
      );
    }
    return Container();
  }

  /// onSizeSelected
  void onSizeSelected(int size) {
    setState(() {
      widget.item.size = size;
    });
  }
}
