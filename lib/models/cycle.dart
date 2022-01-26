import 'package:nsuns/models/day.dart';

class Cycle {
  final String id;
  final String programType;
  final List<Day> days;
  final bool complete;
  final DateTime startDate;

  Cycle({
    this.id = '',
    this.programType = 'four-day',
    this.days = const [],
    this.complete = false,
    required this.startDate,
  });
}
