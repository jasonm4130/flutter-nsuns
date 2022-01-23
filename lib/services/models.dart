import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/builder.dart';
part 'models.g.dart';

@JsonSerializable()
class User {
  final String uid;
  final String name;
  final String email;
  final List<Excercise> excercises;
  final String programTemplate;
  final String units;
  final double smallestPlate;

  User({
    this.uid = '',
    this.name = '',
    this.email = '',
    this.excercises = const [],
    this.programTemplate = 'four-day',
    this.units = 'kgs',
    this.smallestPlate = 1.25,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Cycle {
  final String programType;
  final List<Day> days;
  final bool complete;
  final DateTime startDate;

  Cycle({
    this.programType = 'four-day',
    this.days = const [],
    this.complete = false,
    required this.startDate,
  });

  factory Cycle.fromJson(Map<String, dynamic> json) => _$CycleFromJson(json);
  Map<String, dynamic> toJson() => _$CycleToJson(this);
}

@JsonSerializable()
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

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
  Map<String, dynamic> toJson() => _$DayToJson(this);
}

@JsonSerializable()
class Excercise {
  final String name;
  final double trainingMax;
  final double estimated1RM;
  final int repsToProgess;
  final int percentageOfMainLift;
  final bool isMainLift;
  final bool isAccessory;
  final Excercise? mainLift;
  final double progression;
  final List<DataPoint> dataPoints;
  final RepScheme? t1RepScheme;
  final RepScheme? t2RepScheme;

  Excercise({
    required this.name,
    required this.trainingMax,
    this.estimated1RM = 0,
    this.repsToProgess = 1,
    this.percentageOfMainLift = 0,
    this.isMainLift = true,
    this.isAccessory = false,
    this.mainLift,
    this.progression = 1.25,
    this.dataPoints = const [],
    this.t1RepScheme,
    this.t2RepScheme,
  });

  factory Excercise.fromJson(Map<String, dynamic> json) =>
      _$ExcerciseFromJson(json);
  Map<String, dynamic> toJson() => _$ExcerciseToJson(this);
}

@JsonSerializable()
class DataPoint {
  final DateTime date;
  final Excercise excercise;
  final double estimated1RM;

  DataPoint({
    required this.date,
    required this.excercise,
    this.estimated1RM = 0,
  });

  factory DataPoint.fromJson(Map<String, dynamic> json) =>
      _$DataPointFromJson(json);
  Map<String, dynamic> toJson() => _$DataPointToJson(this);
}

@JsonSerializable()
class RepScheme {
  final List<Set> sets;

  RepScheme({
    required this.sets,
  });

  factory RepScheme.fromJson(Map<String, dynamic> json) =>
      _$RepSchemeFromJson(json);
  Map<String, dynamic> toJson() => _$RepSchemeToJson(this);
}

@JsonSerializable()
class Accessory {
  final Excercise excercise;
  final RepScheme repScheme;

  Accessory({
    required this.excercise,
    required this.repScheme,
  });

  factory Accessory.fromJson(Map<String, dynamic> json) =>
      _$AccessoryFromJson(json);
  Map<String, dynamic> toJson() => _$AccessoryToJson(this);
}

@JsonSerializable()
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

  factory Set.fromJson(Map<String, dynamic> json) => _$SetFromJson(json);
  Map<String, dynamic> toJson() => _$SetToJson(this);
}
