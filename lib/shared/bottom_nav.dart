import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  void _navigateBottomBar(int index) {
    // Navigate to the new screen
    String route;

    switch (index) {
      case 0:
        route = '/';
        break;
      case 1:
        route = '/progress';
        break;
      case 2:
        route = '/settings';
        break;
      default:
        route = '/';
    }

    // Update the route of the app
    Navigator.of(context).pushNamed(
      route,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _navigateBottomBar,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.chartLine),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.cog),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
