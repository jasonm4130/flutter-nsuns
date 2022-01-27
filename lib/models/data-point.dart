import 'package:nsuns/models/exercise.dart';

class DataPoint {
  final DateTime date;
  final Exercise exercise;
  final double estimated1RM;

  DataPoint({
    required this.date,
    required this.exercise,
    this.estimated1RM = 0,
  });
}
