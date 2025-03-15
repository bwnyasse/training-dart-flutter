import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Travel Explorer Profile Page'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/'),
              child: const Text('Explore Home'),
            ),
          ],
        ),
      ),
    );
  }
}