import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/src/stores/counter.dart';

class IncrementFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = context.watch<Counter>();
    return FloatingActionButton(
      onPressed: counter.increment,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}
