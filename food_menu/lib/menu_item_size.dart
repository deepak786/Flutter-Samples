import 'package:flutter/material.dart';

class MenuItemSize extends StatefulWidget {
  final String title;
  final bool selected;
  final GestureTapCallback clicked;

  MenuItemSize(this.title, this.selected, this.clicked);

  @override
  _MenuItemSizeState createState() => _MenuItemSizeState();
}

class _MenuItemSizeState extends State<MenuItemSize> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.clicked,
      child: Container(
        decoration: BoxDecoration(
          color: widget.selected ? Colors.yellow : Colors.transparent,
          border: Border.all(color: Colors.grey, width: 0.5),
        ),
        width: 95,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            widget.title,
            style: TextStyle(
              color: widget.selected ? Colors.black : Colors.grey,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
