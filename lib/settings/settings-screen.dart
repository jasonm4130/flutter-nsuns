import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nsuns/models/excercise.dart';
import 'package:nsuns/models/settings.dart';
import 'package:nsuns/shared/excercise-card.dart';
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
              'Are you sure you want to reset all excercises to default?'),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: const Text('Reset'),
              onPressed: () {
                Provider.of<Settings>(context, listen: false).resetExcercises();
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
                  items: <String>[
                    'Four Day',
                    'Five Day',
                    'Six Day Squat',
                    'Six Day Deadlift'
                  ].map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: toKebabCase(value),
                        child: Text(value),
                      );
                    },
                  ).toList(),
                  value: toKebabCase(settings.programTemplate),
                  onChanged: (value) {
                    settings.setProgramTemplate = value.toString();
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
                    settings.setUnits = value.toString();
                  },
                  value: settings.units,
                  isExpanded: true,
                ),
                const SizedBox(height: 16),
                Text(
                  'Smallest Plate',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Smallest Plate',
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  onEditingComplete: () {
                    settings.setSmallestPlate =
                        double.parse(_smallestPlateController.text);
                  },
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.subtitle1,
                  controller: _smallestPlateController,
                ),
                const SizedBox(height: 16),
                Text(
                  'Excercises',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                ...settings.excercises.map<Widget>(
                  (Excercise excercise) {
                    return ExcerciseCard(
                      excercise: excercise,
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      child: const Text('Add Excercise'),
                      onPressed: () {},
                    ),
                    ElevatedButton(
                      child: const Text('Reste Excercises'),
                      onPressed: _showResetDialogue,
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
