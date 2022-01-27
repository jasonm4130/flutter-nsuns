import 'package:nsuns/models/accessory.dart';
import 'package:nsuns/models/exercise.dart';
import 'package:nsuns/models/rep-scheme.dart';

class Day {
  final Exercise t1Movement;
  final RepScheme t1RepScheme;
  final Exercise t2Movement;
  final RepScheme t2RepScheme;
  final List<Accessory> accessories;
  final String notes;
  final bool complete;

  Day({
    required this.t1Movement,
    required this.t1RepScheme,
    required this.t2Movement,
    required this.t2RepScheme,
    this.accessories = const [],
    this.notes = '',
    this.complete = false,
  });
}
