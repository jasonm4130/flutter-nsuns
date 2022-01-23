import 'package:nsuns/cycle/cycle.dart';
import 'package:nsuns/home/home.dart';
import 'package:nsuns/progress/progress.dart';
import 'package:nsuns/settings/settings.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/cycle': (context) => const CycleScreen(),
  '/progress': (context) => const ProgressScreen(),
  '/settings': (context) => const SettingsScreen(),
};
