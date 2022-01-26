import 'package:nsuns/models/data-point.dart';
import 'package:nsuns/models/rep-scheme.dart';

class Excercise {
  final String identifier;
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
  final RepScheme? t1RepSchemeDayTwo;

  Excercise({
    required this.identifier,
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
    this.t1RepSchemeDayTwo,
  });
}

Excercise bench = Excercise(
  identifier: 'bench-press',
  name: 'Bench Press',
  trainingMax: 0,
  estimated1RM: 0,
  repsToProgess: 1,
  percentageOfMainLift: 100,
  isMainLift: true,
  isAccessory: false,
  progression: 2.5,
  dataPoints: [],
  t1RepScheme: t1RepSchemeBench,
  t2RepScheme: t2RepScheme,
  t1RepSchemeDayTwo: t1RepSchemeBenchDayTwo,
);

Excercise squat = Excercise(
  identifier: 'squat',
  name: 'Squat',
  trainingMax: 0,
  estimated1RM: 0,
  repsToProgess: 1,
  percentageOfMainLift: 100,
  isMainLift: true,
  isAccessory: false,
  progression: 2.5,
  dataPoints: [],
  t1RepScheme: t1RepSchemeSquat,
  t2RepScheme: t2RepScheme,
);

Excercise deadlift = Excercise(
  identifier: 'deadlift',
  name: 'Deadlift',
  trainingMax: 0,
  estimated1RM: 0,
  repsToProgess: 1,
  percentageOfMainLift: 100,
  isMainLift: true,
  isAccessory: false,
  progression: 2.5,
  dataPoints: [],
  t1RepScheme: t1RepSchemeDeadlift,
  t2RepScheme: t2RepScheme,
);

Excercise press = Excercise(
  identifier: 'press',
  name: 'Press',
  trainingMax: 0,
  estimated1RM: 0,
  repsToProgess: 1,
  percentageOfMainLift: 100,
  isMainLift: true,
  isAccessory: false,
  progression: 2.5,
  dataPoints: [],
  t2RepScheme: t2RepScheme,
);

Excercise frontSquat = Excercise(
  identifier: 'front-squat',
  name: 'Front Squat',
  trainingMax: 0,
  estimated1RM: 0,
  repsToProgess: 1,
  percentageOfMainLift: 55,
  isMainLift: false,
  isAccessory: true,
  mainLift: squat,
  progression: 2.5,
  dataPoints: [],
  t2RepScheme: t2RepScheme,
);

Excercise closeGripBench = Excercise(
  identifier: 'close-grip-bench',
  name: 'Close Grip Bench',
  trainingMax: 0,
  estimated1RM: 0,
  repsToProgess: 1,
  percentageOfMainLift: 55,
  isMainLift: false,
  isAccessory: true,
  mainLift: bench,
  progression: 2.5,
  dataPoints: [],
  t2RepScheme: t2RepScheme,
);

Excercise sumoDeadlift = Excercise(
  identifier: 'sumo-deadlift',
  name: 'Sumo Deadlift',
  trainingMax: 0,
  estimated1RM: 0,
  repsToProgess: 1,
  percentageOfMainLift: 55,
  isMainLift: false,
  isAccessory: true,
  mainLift: deadlift,
  progression: 2.5,
  dataPoints: [],
  t2RepScheme: t2RepScheme,
);
