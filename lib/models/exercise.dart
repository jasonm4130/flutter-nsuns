import 'package:nsuns/models/data-point.dart';
import 'package:nsuns/models/rep-scheme.dart';
import 'package:uuid/uuid.dart';

class Exercise {
  String identifier;
  String name;
  double trainingMax;
  double estimated1RM;
  int repsToProgress;
  int percentageOfMainLift;
  bool isMainLift;
  Exercise? mainLift;
  double progression;
  List<DataPoint> dataPoints;

  Exercise({
    required this.identifier,
    required this.name,
    required this.trainingMax,
    this.estimated1RM = 0,
    this.repsToProgress = 1,
    this.percentageOfMainLift = 0,
    this.isMainLift = true,
    this.mainLift,
    this.progression = 2.5,
    this.dataPoints = const [],
  });
}

var uuid = const Uuid();

Exercise bench = Exercise(
  identifier: uuid.v4(),
  name: 'Bench Press',
  trainingMax: 0,
  estimated1RM: 0,
  repsToProgress: 1,
  percentageOfMainLift: 100,
  isMainLift: true,
  progression: 2.5,
  dataPoints: [],
);

Exercise squat = Exercise(
  identifier: uuid.v4(),
  name: 'Squat',
  trainingMax: 0,
  estimated1RM: 0,
  repsToProgress: 1,
  percentageOfMainLift: 100,
  isMainLift: true,
  progression: 2.5,
  dataPoints: [],
);

Exercise deadlift = Exercise(
  identifier: uuid.v4(),
  name: 'Deadlift',
  trainingMax: 0,
  estimated1RM: 0,
  repsToProgress: 1,
  percentageOfMainLift: 100,
  isMainLift: true,
  progression: 2.5,
  dataPoints: [],
);

Exercise press = Exercise(
  identifier: uuid.v4(),
  name: 'Press',
  trainingMax: 0,
  estimated1RM: 0,
  repsToProgress: 1,
  percentageOfMainLift: 100,
  isMainLift: true,
  progression: 2.5,
  dataPoints: [],
);

Exercise frontSquat = Exercise(
  identifier: uuid.v4(),
  name: 'Front Squat',
  trainingMax: 0,
  estimated1RM: 0,
  repsToProgress: 1,
  percentageOfMainLift: 55,
  isMainLift: false,
  mainLift: squat,
  progression: 2.5,
  dataPoints: [],
);

Exercise closeGripBench = Exercise(
  identifier: uuid.v4(),
  name: 'Close Grip Bench',
  trainingMax: 0,
  estimated1RM: 0,
  repsToProgress: 1,
  percentageOfMainLift: 55,
  isMainLift: false,
  mainLift: bench,
  progression: 2.5,
  dataPoints: [],
);

Exercise sumoDeadlift = Exercise(
  identifier: uuid.v4(),
  name: 'Sumo Deadlift',
  trainingMax: 0,
  estimated1RM: 0,
  repsToProgress: 1,
  percentageOfMainLift: 55,
  isMainLift: false,
  mainLift: deadlift,
  progression: 2.5,
  dataPoints: [],
);

Exercise inclineBench = Exercise(
  identifier: uuid.v4(),
  name: 'Incline Bench',
  trainingMax: 0,
  estimated1RM: 0,
  repsToProgress: 1,
  percentageOfMainLift: 55,
  isMainLift: false,
  mainLift: bench,
  progression: 2.5,
  dataPoints: [],
);

List<Exercise> defaultExercises = [
  bench,
  squat,
  deadlift,
  press,
  frontSquat,
  closeGripBench,
  sumoDeadlift,
  inclineBench,
];
