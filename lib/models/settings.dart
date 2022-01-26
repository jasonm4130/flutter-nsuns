import 'package:flutter/material.dart';
import 'package:nsuns/models/excercise.dart';
import 'package:nsuns/shared/default-excercises.dart';

class Settings extends ChangeNotifier {
  List<Excercise> _excercises = defaultExcercises;
  String _programTemplate = 'four-day';
  String _units = 'metric';
  double _smallestPlate = 1.25;

  // Getters
  List<Excercise> get excercises => _excercises;
  String get programTemplate => _programTemplate;
  String get units => _units;
  double get smallestPlate => _smallestPlate;

  // Setters
  set setExcercises(List<Excercise> excercises) {
    _excercises = excercises;
    notifyListeners();
  }

  set setProgramTemplate(String programTemplate) {
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
  void resetExcercises() {
    _excercises = defaultExcercises;
    notifyListeners();
  }
}
