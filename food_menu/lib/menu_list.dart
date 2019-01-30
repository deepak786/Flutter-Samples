import 'package:flutter/material.dart';

import 'item.dart';
import 'menu_item.dart';

class MenuList extends StatefulWidget {
  final Function menuItemAction;

  MenuList({this.menuItemAction});

  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList>
    with AutomaticKeepAliveClientMixin<MenuList> {
  List<Item> data;

  @override
  void initState() {
    data = getDummyData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return MenuItem(
          data[index],
          menuItemAction: widget.menuItemAction,
        );
      },
      itemCount: data.length,
    );
  }

  // get dummy data
  List<Item> getDummyData() {
    return new List.generate(10, (int index) {
      return Item();
    });
  }

  @override
  bool get wantKeepAlive => true;
}
