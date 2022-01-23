import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nsuns/services/auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: Column(
                children: const [
                  Text(
                    'Welcome to Nuns',
                    style: TextStyle(fontSize: 30),
                  ),
                  Center(
                    child: FaIcon(
                      FontAwesomeIcons.dumbbell,
                      size: 100,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: LoginButton(
                text: 'Continue as Guest',
                icon: FontAwesomeIcons.userNinja,
                color: Colors.red,
                loginMethod: AuthService().anonLogin,
              ),
            ),
            Flexible(
              child: LoginButton(
                text: 'Login with Google',
                icon: FontAwesomeIcons.google,
                color: Colors.blue,
                loginMethod: AuthService().googleLogin,
              ),
            ),
            Flexible(
              child: LoginButton(
                text: 'Login with Apple',
                icon: FontAwesomeIcons.apple,
                color: Colors.black,
                loginMethod: AuthService().appleLogin,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon;
  final Function loginMethod;

  const LoginButton(
      {Key? key,
      required this.color,
      required this.text,
      required this.icon,
      required this.loginMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton.icon(
        icon: Icon(icon, color: Colors.white, size: 30),
        label: Text(text),
        onPressed: () => loginMethod(),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(24),
          backgroundColor: color,
        ),
      ),
    );
  }
}
