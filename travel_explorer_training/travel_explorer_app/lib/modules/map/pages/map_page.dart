import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Explore Destinations',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            const Icon(
              Icons.map,
              size: 100,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Modular.to.pop(),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}