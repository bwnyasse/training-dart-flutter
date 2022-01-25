import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  void initState() {
    super.initState();
  }

@override
  void didUpdateWidget(covariant Demo oldWidget) {
    // OLD WIDGET
    super.didUpdateWidget(oldWidget);
  }


  @override
  Widget build(BuildContext context) {
    setState(() {
      // une action qui modifie l'état du widget
    });
    return Container();
  }
}

class SansEtat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(),
      ),
    );
  }
}
