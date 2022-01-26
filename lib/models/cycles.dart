import 'package:flutter/material.dart';
import 'package:nsuns/models/cycle.dart';

class Cycles extends ChangeNotifier {
  final List<Cycle> _cycles = [];

  List<Cycle> get cycles {
    return [..._cycles];
  }

  void addCycle(Cycle cycle) {
    _cycles.add(cycle);
    notifyListeners();
  }

  void removeCycle(Cycle cycle) {
    _cycles.remove(cycle);
    notifyListeners();
  }

  void updateCycle(Cycle cycle) {
    _cycles.removeWhere((c) => c.id == cycle.id);
    _cycles.add(cycle);
    notifyListeners();
  }

  void clear() {
    _cycles.clear();
    notifyListeners();
  }
}
