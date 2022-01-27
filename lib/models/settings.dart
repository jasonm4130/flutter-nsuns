import 'package:flutter/material.dart';
import 'package:nsuns/models/exercise.dart';
import 'package:nsuns/models/program.dart';

class Settings extends ChangeNotifier {
  List<Exercise> _exercises = [...defaultExercises];
  Program _programTemplate = fourDay;
  String _units = 'metric';
  double _smallestPlate = 1.25;

  // Getters
  List<Exercise> get exercises => _exercises;
  Program get programTemplate => _programTemplate;
  String get units => _units;
  double get smallestPlate => _smallestPlate;

  // Setters
  set setExercise(List<Exercise> exercises) {
    _exercises = exercises;
    notifyListeners();
  }

  set setProgramTemplate(Program programTemplate) {
    _programTemplate = programTemplate;
    notifyListeners();
  }

  set setUnits(String units) {
    _units = units;
    notifyListeners();
  }

  set setSmallestPlate(double smallestPlate) {
    _smallestPlate = smallestPlate;
    notifyListeners();
  }

  // Methods
  void resetExercises() {
    _exercises = [...defaultExercises];
    notifyListeners();
  }

  void deleteExercise(String identifier) {
    _exercises.removeWhere((exercise) => exercise.identifier == identifier);
    notifyListeners();
  }

  void addExercise(Exercise exercise) {
    _exercises.add(exercise);
    notifyListeners();
  }

  void updateExercise(Exercise exercise) {
    _exercises.removeWhere((ex) => ex.identifier == exercise.identifier);
    _exercises.add(exercise);
    notifyListeners();
  }

  // Update the exercise training max, estimated 1RM, and progression to match the new units
  void updateExerciseUnits() {
    // Updated the smallest plate
    if (_units == 'imperial') {
      _smallestPlate = _smallestPlate * 2.20462;
    } else {
      _smallestPlate = _smallestPlate / 2.20462;
    }

    // Update the exercises
    for (var exercise in _exercises) {
      if (_units == 'imperial') {
        exercise.trainingMax = exercise.trainingMax * 2.20462;
        exercise.estimated1RM = exercise.estimated1RM * 2.20462;
        exercise.progression = exercise.progression * 2.20462;
      } else {
        exercise.trainingMax = exercise.trainingMax / 2.20462;
        exercise.estimated1RM = exercise.estimated1RM / 2.20462;
        exercise.progression = exercise.progression / 2.20462;
      }
    }

    notifyListeners();
  }
}
