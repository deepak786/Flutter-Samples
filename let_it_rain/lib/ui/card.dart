import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  final Widget children;

  const Card({
    Key key,
    @required this.children,
  })  : assert(children != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(15.0),
      child: children,
      color: Colors.white,
    );
  }
}
