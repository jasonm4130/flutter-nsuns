import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nsuns/models/excercise.dart';

class ExcerciseCard extends StatelessWidget {
  final Excercise excercise;

  const ExcerciseCard({Key? key, required this.excercise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(excercise.name),
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.edit),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.trash),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
