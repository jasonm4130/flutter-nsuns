import 'package:nsuns/cycle/cycle-screen.dart';
import 'package:nsuns/home/home-screen.dart';
import 'package:nsuns/progress/progress-screen.dart';
import 'package:nsuns/settings/settings-screen.dart';
import 'package:nsuns/exercise/exercise-screen.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/cycle': (context) => const CycleScreen(),
  '/progress': (context) => const ProgressScreen(),
  '/settings': (context) => const SettingsScreen(),
  '/exercise': (context) => const ExerciseScreen(),
};
