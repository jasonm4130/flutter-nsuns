import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nsuns/models/exercise.dart';
import 'package:nsuns/models/program.dart';
import 'package:nsuns/models/settings.dart';
import 'package:nsuns/shared/exercise-card.dart';
import 'package:nsuns/shared/helpers/formatters.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void _showResetDialogue() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Reset'),
          content: const Text(
              'Are you sure you want to reset all exercises to default?'),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: const Text('Reset'),
              onPressed: () {
                Provider.of<Settings>(context, listen: false).resetExercises();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _smallestPlateController = TextEditingController(
      text: Provider.of<Settings>(context, listen: false)
          .smallestPlate
          .toString(),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Consumer<Settings>(
        builder: (BuildContext context, Settings settings, Widget? child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Program Template',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                DropdownButton(
                  items: <Program>[...defaultPrograms]
                      .map<DropdownMenuItem<Program>>(
                    (Program program) {
                      return DropdownMenuItem<Program>(
                        value: program,
                        child: Text(program.name),
                      );
                    },
                  ).toList(),
                  value: settings.programTemplate,
                  onChanged: (value) {
                    settings.setProgramTemplate = value as Program;
                  },
                  isExpanded: true,
                ),
                const SizedBox(height: 16),
                Text(
                  'Units',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                DropdownButton(
                  items: <String>['Metric', 'Imperial']
                      .map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value.toLowerCase(),
                        child: Text(value),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    // Check if the value has changed before updating
                    if (value != settings.units) {
                      settings.setUnits = value.toString();
                      settings.updateExerciseUnits();
                      // Update the smallest plate text field
                      _smallestPlateController.text =
                          settings.smallestPlate.toString();
                    }
                  },
                  value: settings.units,
                  isExpanded: true,
                ),
                const SizedBox(height: 16),
                Text(
                  'Smallest Plate',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Focus(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Smallest Plate',
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onEditingComplete: () {
                      settings.setSmallestPlate =
                          double.parse(_smallestPlateController.text);
                      // Lose focus
                      FocusScope.of(context).unfocus();
                    },
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.subtitle1,
                    controller: _smallestPlateController,
                  ),
                  canRequestFocus: false,
                  onFocusChange: (hasFocus) {
                    if (!hasFocus) {
                      settings.setSmallestPlate =
                          double.parse(_smallestPlateController.text);
                      // Lose focus
                      FocusScope.of(context).unfocus();
                    }
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  'Exercises',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                ...settings.exercises.map<Widget>(
                  (Exercise exercise) {
                    return ExerciseCard(
                      exercise: exercise,
                      onDelete: settings.deleteExercise,
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      child: const Text('Add Exercise'),
                      onPressed: () {
                        // Go to the exercise screen
                        Navigator.of(context).pushNamed('/exercise');
                      },
                    ),
                    ElevatedButton(
                      child: const Text('Reset Exercise'),
                      onPressed: _showResetDialogue,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Programs',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
