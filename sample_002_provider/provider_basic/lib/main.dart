import 'package:flutter/material.dart';
import 'package:provider_basic/src/providers/stores_provider.dart';
import 'package:provider_basic/src/widgets/counter_info.dart';
import 'package:provider_basic/src/widgets/increment_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoresProvider(
      child: MaterialApp(
        title: 'MobX & ProviderDemo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Mobx & Provider Counter'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: CounterInfo(),
      floatingActionButton: IncrementFloatingActionButton(),
    );
  }
}
