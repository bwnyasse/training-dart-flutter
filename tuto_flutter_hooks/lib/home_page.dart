import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController;
  AnimationController _hideFabAnimController;

  @override
  void dispose() {
    _scrollController.dispose();
    _hideFabAnimController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _hideFabAnimController = AnimationController(
      vsync: this,
      duration: kThemeAnimationDuration,
      value: 1, // initially visible
    );

    _scrollController.addListener(() {
      switch (_scrollController.position.userScrollDirection) {
        // Scrolling up - forward the animation (value goes to 1)
        case ScrollDirection.forward:
          _hideFabAnimController.forward();
          break;
        // Scrolling down - reverse the animation (value goes to 0)
        case ScrollDirection.reverse:
          _hideFabAnimController.reverse();
          break;
        // Idle - keep FAB visibility unchanged
        case ScrollDirection.idle:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //body:
      floatingActionButton: FadeTransition(
        opacity: _hideFabAnimController,
        child: ScaleTransition(
          scale: _hideFabAnimController,
          child: FloatingActionButton.extended(
            label: const Text(' Floating Non utilisé'),
            onPressed: () {},
          ),
        ),
      ),
     // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        controller: _scrollController,
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
