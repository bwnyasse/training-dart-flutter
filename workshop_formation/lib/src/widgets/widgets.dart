import 'dart:math';

import 'package:flutter/material.dart';

// ------------------
// LIST ITEM
// ------------------
class ListItem extends StatefulWidget {
  final int index;

  ListItem({required this.index}) {
    print('creating list item $index');
  }

  @override
  ListItemState createState() {
    print('creating list item state $index');
    return ListItemState();
  }
}

class ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    print('building list item ${widget.index}');
    return Container(
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      height: 500,
      child: Center(
          child: Text(
        widget.index.toString(),
      )),
    );
  }
}
// ------------------
