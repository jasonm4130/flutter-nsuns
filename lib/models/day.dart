import 'package:nsuns/models/accessory.dart';
import 'package:nsuns/models/excercise.dart';

class Day {
  final Excercise t1Movement;
  final Excercise t2Movement;
  final List<Accessory> accessories;
  final String notes;
  final bool complete;

  Day({
    required this.t1Movement,
    required this.t2Movement,
    this.accessories = const [],
    this.notes = '',
    this.complete = false,
  });
}
