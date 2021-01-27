import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'hooks/animation.dart';

class MyHomePage extends HookWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final hideFabAnimController = useAnimationController(
        duration: kThemeAnimationDuration, initialValue: 1);
    final scrollController =
        useScrollControllerForAnimation(hideFabAnimController);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      //body:
      floatingActionButton: FadeTransition(
        opacity: hideFabAnimController,
        child: ScaleTransition(
          scale: hideFabAnimController,
          child: FloatingActionButton.extended(
            label: const Text(' Floating Non utilisé'),
            onPressed: () {},
          ),
        ),
      ),
     // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        controller: scrollController,
        children: <Widget>[
          for (int i = 0; i < 5; i++) ListItem(index: i + 1),
        ],
      ),
    );
  }
}

class ListItem extends StatefulWidget {
  final int index;

  ListItem({this.index}) {
    print('creating list item $index');
  }

  @override
  ListItemState createState() {
    // print('creating list item state $index');
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
        style: TextStyle(fontSize: 128.0,fontWeight: FontWeight.bold),
      )),
    );
  }
}
