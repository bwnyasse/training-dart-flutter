import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/src/stores/counter.dart';

class StoresProvider extends StatelessWidget {
  final Widget child;

  StoresProvider({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Counter>(create: (_) => Counter()),
      ],
      child: child,
    );
  }
}
