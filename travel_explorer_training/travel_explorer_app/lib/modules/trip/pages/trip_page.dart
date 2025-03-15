import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TripPage extends StatelessWidget {
  const TripPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Travel Explorer Trip Page'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/profile/'),
              child: const Text('Explore Profile'),
            ),
          ],
        ),
      ),
    );
  }
}