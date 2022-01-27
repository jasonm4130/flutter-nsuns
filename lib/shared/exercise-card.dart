import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nsuns/models/exercise.dart';

class ExerciseCard extends StatelessWidget {
  final Exercise exercise;
  void Function(String)? onDelete;

  ExerciseCard({Key? key, required this.exercise, this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(exercise.name),
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.edit),
              onPressed: () {
                Navigator.pushNamed(context, '/exercise', arguments: exercise);
              },
            ),
            // If we have been passed a function to call when the delete button is pressed,
            // then we'll add a delete button.
            if (onDelete != null)
              IconButton(
                icon: const Icon(FontAwesomeIcons.trash),
                onPressed: () {
                  onDelete!(exercise.identifier);
                },
              ),
          ],
        ),
      ),
    );
  }
}
