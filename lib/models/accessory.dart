import 'package:nsuns/models/exercise.dart';
import 'package:nsuns/models/rep-scheme.dart';

class Accessory {
  final Exercise exercise;
  final RepScheme repScheme;

  Accessory({
    required this.exercise,
    required this.repScheme,
  });
}
