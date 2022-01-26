import 'package:flutter/material.dart';
import 'package:nsuns/shared/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text(
          'Home',
          style: TextStyle(fontSize: 50),
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
