import 'dart:math';

import 'package:flutter/material.dart';

// ------------------
// LIST ITEM
// ------------------
class ListItem extends StatefulWidget {
  final String data;
  final GestureTapCallback onTapCallback;
  ListItem({
    required this.data,
    required this.onTapCallback,
  }) {
    print('creating list item $data');
  }

  @override
  ListItemState createState() {
    print('creating list item state $data');
    return ListItemState();
  }
}

class ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    print('building list item ${widget.data}');
    return GestureDetector(
      onTap: widget.onTapCallback,
      child: Container(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        height: 500,
        child: Center(
            child: Text(
          widget.data.toString(),
        )),
      ),
    );
  }
}
// ------------------