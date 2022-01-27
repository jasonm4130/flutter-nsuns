import 'package:nsuns/models/program.dart';

class Cycle {
  final String id;
  final Program program;
  final bool complete;
  final DateTime startDate;

  // Methods
  double get percentComplete {
    int totalNumberOfSets = 0;
    int completedNumberOfSets = 0;

    // For each day in the program
    for (final day in program.days) {
      // Get the t1 and t2 rep schemes for the day
      final t1 = day.t1RepScheme;
      final t2 = day.t2RepScheme;

      // Get the number of sets for the day
      final numberOfSets = t1.sets.length + t2.sets.length;

      // Add the number of sets to the total number of sets
      totalNumberOfSets += numberOfSets;

      // For each set in the day
      for (final set in t1.sets) {
        // If the set is completed
        if (set.complete) {
          // Add one to the number of completed sets
          completedNumberOfSets++;
        }
      }

      for (final set in t2.sets) {
        // If the set is completed
        if (set.complete) {
          // Add one to the number of completed sets
          completedNumberOfSets++;
        }
      }
    }

    // Return the percentage of sets completed
    return completedNumberOfSets / totalNumberOfSets;
  }

  Cycle({
    this.id = '',
    this.complete = false,
    required this.startDate,
    required this.program,
  });
}
