import 'dart:math';

import 'package:flutter/material.dart';

// ------------------
// LIST ITEM
// ------------------
class ListItem extends StatefulWidget {
  final String? imgUrl;
  final String? data;
  final GestureTapCallback? onTapCallback;
  ListItem({this.imgUrl, this.data, this.onTapCallback}) {
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
            child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              //RESOLUTION: Afficher l'image qui est dans la variable imgUrl
              Image.network(widget.imgUrl!),
              Text(
                widget.data.toString(),
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
// ------------------
