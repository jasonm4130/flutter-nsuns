import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:nsuns/models/cycle.dart';
import 'package:nsuns/models/cycles.dart';
import 'package:nsuns/models/settings.dart';
import 'package:nsuns/shared/bottom_nav.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Consumer<Cycles>(
        builder: (BuildContext context, Cycles cycles, Widget? child) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    // For each cycle in the list, display a card with the cycle's
                    // name and a button to navigate to the cycle's page.
                    for (final cycle in cycles.cycles)
                      Card(
                        child: Dismissible(
                          direction: DismissDirection.endToStart,
                          key: Key(cycle.id),
                          onDismissed: (direction) {
                            cycles.removeCycle(cycle);
                          },
                          background: Container(
                              alignment: AlignmentDirectional.centerEnd,
                              color: Colors.red,
                              child: const Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                                child: Icon(
                                  FontAwesomeIcons.trashAlt,
                                  color: Colors.white,
                                ),
                              )),
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                          "${formatDate(cycle.startDate)} - ${cycle.program.name}")),
                                  CircularPercentIndicator(
                                    radius: 25.0,
                                    lineWidth: 5.0,
                                    percent: cycle.percentComplete,
                                    center: Text(
                                      "${(cycle.percentComplete * 100).toStringAsFixed(0)}%",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    progressColor: cycle.percentComplete >= 1.0
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                Center(
                  child: ElevatedButton(
                    child: const Text('Add Cycle'),
                    onPressed: () {
                      // Add a cycle to the cycle list
                      cycles.addCycle(
                        Cycle(
                          id: uuid.v4(),
                          startDate: getMondayOfWeek(DateTime.now()),
                          program: Provider.of<Settings>(context, listen: false)
                              .programTemplate,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}

DateTime getMondayOfWeek(DateTime date) {
  // Get the day of the week
  final dayOfWeek = date.weekday;

  // Get the number of days to subtract from the current date to get the
  // Monday of the week
  final daysToSubtract = dayOfWeek - 1;

  // Subtract the number of days to get the Monday of the week
  return date.subtract(Duration(days: daysToSubtract));
}

String formatDate(DateTime date) {
  DateFormat dateFormat = DateFormat('E d, MMM');
  return dateFormat.format(date);
}
