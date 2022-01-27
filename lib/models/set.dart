class Set {
  int reps;
  double? percentageOfTrainingMax;
  double? weight;
  bool isAMRAP;
  int? repsCompleted;
  bool complete;

  Set({
    required this.reps,
    this.percentageOfTrainingMax,
    this.weight,
    this.isAMRAP = false,
    this.complete = false,
  });
}
