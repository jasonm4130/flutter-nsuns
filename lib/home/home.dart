import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nsuns/login/login.dart';
import 'package:nsuns/services/auth.dart';
import 'package:nsuns/shared/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
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
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
