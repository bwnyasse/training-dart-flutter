import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop_formation/src/services/services.dart';

///
/// My App Provider responsible to inject
/// Object as singleton
///
class AppProvider extends StatelessWidget {
  final Widget child;

  AppProvider({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // TODO: En s'inspirant du TP sur Provider, fournit l'instance de ApiService()
      ],
      child: child,
    );
  }
}