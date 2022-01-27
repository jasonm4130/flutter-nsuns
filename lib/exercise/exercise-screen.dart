import 'package:flutter/material.dart';
import 'package:nsuns/models/exercise.dart';
import 'package:nsuns/models/settings.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({Key? key}) : super(key: key);
  final uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    final exercise = ModalRoute.of(context)!.settings.arguments as Exercise? ??
        Exercise(identifier: uuid.v4(), name: '', trainingMax: 0);

    // If the excercise isn't in the list, add it
    if (Provider.of<Settings>(context, listen: false).exercises.indexWhere(
            (element) => element.identifier == exercise.identifier) ==
        -1) {
      Provider.of<Settings>(context, listen: false).exercises.add(exercise);
    }

    TextEditingController _exerciseName = TextEditingController(
      text: exercise.name,
    );

    TextEditingController _trainingMax = TextEditingController(
      text: exercise.trainingMax.toString(),
    );

    TextEditingController _repsToProgress = TextEditingController(
      text: exercise.repsToProgress.toString(),
    );

    TextEditingController _percentageOfMainLift = TextEditingController(
      text: exercise.percentageOfMainLift.toString(),
    );

    TextEditingController _progression = TextEditingController(
      text: exercise.progression.toString(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise'),
      ),
      body: Consumer<Settings>(
        builder: (BuildContext context, Settings settings, Widget? child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      exercise.name.isNotEmpty ? exercise.name : 'New Exercise',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Focus(
                    child: TextField(
                      controller: _exerciseName,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                      onEditingComplete: () {
                        if (_exerciseName.text.isNotEmpty) {
                          exercise.name = _exerciseName.text;
                          // Update the exercise
                          Provider.of<Settings>(context, listen: false)
                              .updateExercise(exercise);
                          // Lose focus
                          FocusScope.of(context).unfocus();
                        }
                      },
                    ),
                    canRequestFocus: false,
                    onFocusChange: (hasFocus) {
                      if (!hasFocus) {
                        if (_exerciseName.text.isNotEmpty) {
                          exercise.name = _exerciseName.text;
                          // Update the exercise
                          Provider.of<Settings>(context, listen: false)
                              .updateExercise(exercise);
                          // Lose focus
                          FocusScope.of(context).unfocus();
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 8),
                  Focus(
                    child: TextField(
                      controller: _trainingMax,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Training Max',
                      ),
                      onEditingComplete: () {
                        if (_trainingMax.text.isNotEmpty) {
                          exercise.trainingMax =
                              double.parse(_trainingMax.text);
                          // Update the exercise
                          Provider.of<Settings>(context, listen: false)
                              .updateExercise(exercise);
                          // Lose focus
                          FocusScope.of(context).unfocus();
                        }
                      },
                    ),
                    canRequestFocus: false,
                    onFocusChange: (hasFocus) {
                      if (!hasFocus) {
                        if (_trainingMax.text.isNotEmpty) {
                          exercise.trainingMax =
                              double.parse(_trainingMax.text);
                          // Update the exercise
                          Provider.of<Settings>(context, listen: false)
                              .updateExercise(exercise);
                          // Lose focus
                          FocusScope.of(context).unfocus();
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 8),
                  Text(
                    exercise.estimated1RM != 0
                        ? 'Estimated 1RM: ${exercise.estimated1RM}'
                        : 'Complete one cycle to estimate 1RM',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(height: 8),
                  Focus(
                    child: TextField(
                      controller: _repsToProgress,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Reps to Progress',
                      ),
                      onEditingComplete: () {
                        if (_repsToProgress.text.isNotEmpty) {
                          exercise.repsToProgress =
                              int.parse(_repsToProgress.text);
                          // Update the exercise
                          Provider.of<Settings>(context, listen: false)
                              .updateExercise(exercise);
                          // Lose focus
                          FocusScope.of(context).unfocus();
                        }
                      },
                    ),
                    canRequestFocus: false,
                    onFocusChange: (hasFocus) {
                      if (!hasFocus) {
                        if (_repsToProgress.text.isNotEmpty) {
                          exercise.repsToProgress =
                              int.parse(_repsToProgress.text);
                          // Update the exercise
                          Provider.of<Settings>(context, listen: false)
                              .updateExercise(exercise);
                          // Lose focus
                          FocusScope.of(context).unfocus();
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 8),
                  // If the exercise is not a main lift show the percentage of the main lift
                  if (!exercise.isMainLift)
                    Focus(
                      child: TextField(
                        controller: _percentageOfMainLift,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Percentage of Main Lift',
                        ),
                        onEditingComplete: () {
                          if (_percentageOfMainLift.text.isNotEmpty) {
                            exercise.percentageOfMainLift =
                                int.parse(_percentageOfMainLift.text);
                            // Update the exercise
                            Provider.of<Settings>(context, listen: false)
                                .updateExercise(exercise);
                            // Lose focus
                            FocusScope.of(context).unfocus();
                          }
                        },
                      ),
                      canRequestFocus: false,
                      onFocusChange: (hasFocus) {
                        if (!hasFocus) {
                          if (_percentageOfMainLift.text.isNotEmpty) {
                            exercise.percentageOfMainLift =
                                int.parse(_percentageOfMainLift.text);
                            // Update the exercise
                            Provider.of<Settings>(context, listen: false)
                                .updateExercise(exercise);
                            // Lose focus
                            FocusScope.of(context).unfocus();
                          }
                        }
                      },
                    ),
                  const SizedBox(height: 8),
                  Text('Main lift?',
                      style: Theme.of(context).textTheme.subtitle1),
                  DropdownButton(
                    items: <String>['Yes', 'No'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: exercise.isMainLift ? 'Yes' : 'No',
                    onChanged: (value) {
                      if (value == 'Yes') {
                        exercise.isMainLift = true;
                      } else {
                        exercise.isMainLift = false;
                      }
                      // Update the exercise
                      Provider.of<Settings>(context, listen: false)
                          .updateExercise(exercise);
                    },
                    isExpanded: true,
                  ),
                  if (!exercise.isMainLift)
                    // Select to choose the main lift this exercise is a percentage of
                    DropdownButton(
                      items: <String>[
                        'Select Main Lift',
                        ...Provider.of<Settings>(context, listen: false)
                            .exercises
                            .where((element) => element.isMainLift)
                            .map((mainLift) => mainLift.name)
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: exercise.mainLift != null
                          ? exercise.mainLift!.name
                          : 'Select Main Lift',
                      onChanged: (value) {
                        if (value != 'Select Main Lift') {
                          exercise.mainLift = Provider.of<Settings>(context,
                                  listen: false)
                              .exercises
                              .firstWhere((element) => element.name == value);
                        } else {
                          exercise.mainLift = null;
                        }
                        // Update the exercise
                        Provider.of<Settings>(context, listen: false)
                            .updateExercise(exercise);
                      },
                      isExpanded: true,
                    ),
                  const SizedBox(height: 8),
                  Focus(
                    child: TextField(
                      controller: _progression,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Progression',
                      ),
                      onEditingComplete: () {
                        if (_progression.text.isNotEmpty) {
                          exercise.progression =
                              double.parse(_progression.text);
                          // Update the exercise
                          Provider.of<Settings>(context, listen: false)
                              .updateExercise(exercise);
                          // Lose focus
                          FocusScope.of(context).unfocus();
                        }
                      },
                    ),
                    canRequestFocus: false,
                    onFocusChange: (hasFocus) {
                      if (!hasFocus) {
                        if (_progression.text.isNotEmpty) {
                          exercise.progression =
                              double.parse(_progression.text);
                          // Update the exercise
                          Provider.of<Settings>(context, listen: false)
                              .updateExercise(exercise);
                          // Lose focus
                          FocusScope.of(context).unfocus();
                        }
                      }
                    },
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
          );
        },
      ),
    );
  }
}
