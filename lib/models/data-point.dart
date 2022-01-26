import 'package:nsuns/models/excercise.dart';

class DataPoint {
  final DateTime date;
  final Excercise excercise;
  final double estimated1RM;

  DataPoint({
    required this.date,
    required this.excercise,
    this.estimated1RM = 0,
  });
}
