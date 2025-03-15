import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Travel Explorer Home Page',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/map/'),
              child: const Text('Explore Map'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/profile/'),
              child: const Text('View Profile'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/trip/'),
              child: const Text('Plan Trip'),
            ),
          ],
        ),
      ),
    );
  }
}