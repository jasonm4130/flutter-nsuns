class Set {
  final int reps;
  final int? percentageOfTrainingMax;
  final double? weight;
  final bool isAMRAP;
  final int repsCompleted;

  Set({
    required this.reps,
    this.percentageOfTrainingMax,
    this.weight,
    this.isAMRAP = false,
    this.repsCompleted = 0,
  });
}
