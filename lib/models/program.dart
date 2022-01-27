import 'package:nsuns/models/day.dart';
import 'package:nsuns/models/exercise.dart';
import 'package:nsuns/models/rep-scheme.dart';
import 'package:uuid/uuid.dart';

class Program {
  final String id;
  final String name;
  final List<Day> days;

  Program({required this.days, required this.name, required this.id});
}

var uuid = const Uuid();

Program fourDay = Program(
  id: uuid.v4(),
  name: 'Four Day',
  days: [
    Day(
      t1Movement: bench,
      t1RepScheme: t1RepSchemeBench,
      t2Movement: press,
      t2RepScheme: t2RepScheme,
    ),
    Day(
      t1Movement: squat,
      t1RepScheme: t1RepSchemeSquat,
      t2Movement: sumoDeadlift,
      t2RepScheme: t2RepScheme,
    ),
    Day(
      t1Movement: bench,
      t1RepScheme: t1RepSchemeBench,
      t2Movement: press,
      t2RepScheme: t2RepScheme,
    ),
    Day(
      t1Movement: deadlift,
      t1RepScheme: t1RepSchemeDeadlift,
      t2Movement: frontSquat,
      t2RepScheme: t2RepScheme,
    ),
  ],
);

Program fiveDay = Program(
  id: uuid.v4(),
  name: 'Five Day',
  days: [
    Day(
      t1Movement: bench,
      t1RepScheme: t1RepSchemeBenchDayTwo,
      t2Movement: press,
      t2RepScheme: t2RepScheme,
    ),
    Day(
      t1Movement: squat,
      t1RepScheme: t1RepSchemeSquat,
      t2Movement: sumoDeadlift,
      t2RepScheme: t2RepScheme,
    ),
    Day(
      t1Movement: press,
      t1RepScheme: t1RepSchemePress,
      t2Movement: inclineBench,
      t2RepScheme: t2RepScheme,
    ),
    Day(
      t1Movement: deadlift,
      t1RepScheme: t1RepSchemeDeadlift,
      t2Movement: frontSquat,
      t2RepScheme: t2RepScheme,
    ),
    Day(
      t1Movement: bench,
      t1RepScheme: t1RepSchemeBench,
      t2Movement: closeGripBench,
      t2RepScheme: t2RepScheme,
    ),
  ],
);

Program sixDaySquat = Program(
  id: uuid.v4(),
  name: 'Six Day Squat',
  days: [
    Day(
      t1Movement: bench,
      t1RepScheme: t1RepSchemeBenchDayTwo,
      t2Movement: press,
      t2RepScheme: t2RepScheme,
    ),
    Day(
      t1Movement: squat,
      t1RepScheme: t1RepSchemeSquat,
      t2Movement: sumoDeadlift,
      t2RepScheme: t2RepScheme,
    ),
    Day(
      t1Movement: bench,
      t1RepScheme: t1RepSchemeBench,
      t2Movement: inclineBench,
      t2RepScheme: t2RepScheme,
    ),
    Day(
      t1Movement: deadlift,
      t1RepScheme: t1RepSchemeDeadlift,
      t2Movement: frontSquat,
      t2RepScheme: t2RepScheme,
    ),
    Day(
      t1Movement: bench,
      t1RepScheme: t1RepSchemeBench,
      t2Movement: closeGripBench,
      t2RepScheme: t2RepScheme,
    ),
    Day(
      t1Movement: squat,
      t1RepScheme: t1LowerBodyDayTwo,
      t2Movement: sumoDeadlift,
      t2RepScheme: t2LowerBodyDayTwo,
    ),
  ],
);

Program sixDayDeadlift = Program(
  id: uuid.v4(),
  name: 'Six Day Squat',
  days: [
    Day(
      t1Movement: bench,
      t1RepScheme: t1RepSchemeBenchDayTwo,
      t2Movement: press,
      t2RepScheme: t2RepScheme,
    ),
    Day(
      t1Movement: deadlift,
      t1RepScheme: t1RepSchemeSquat,
      t2Movement: frontSquat,
      t2RepScheme: t2RepScheme,
    ),
    Day(
      t1Movement: bench,
      t1RepScheme: t1RepSchemeBench,
      t2Movement: inclineBench,
      t2RepScheme: t2RepScheme,
    ),
    Day(
      t1Movement: squat,
      t1RepScheme: t1RepSchemeDeadlift,
      t2Movement: sumoDeadlift,
      t2RepScheme: t2RepScheme,
    ),
    Day(
      t1Movement: bench,
      t1RepScheme: t1RepSchemeBench,
      t2Movement: closeGripBench,
      t2RepScheme: t2RepScheme,
    ),
    Day(
      t1Movement: deadlift,
      t1RepScheme: t1LowerBodyDayTwo,
      t2Movement: frontSquat,
      t2RepScheme: t2LowerBodyDayTwo,
    ),
  ],
);

List<Program> defaultPrograms = [
  fourDay,
  fiveDay,
  sixDaySquat,
  sixDayDeadlift,
];
