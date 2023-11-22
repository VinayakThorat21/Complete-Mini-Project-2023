import 'package:flutter/material.dart';
import 'packets/diabetic_count.dart';

class DiabetesPedigreeFunction extends StatelessWidget {
  const DiabetesPedigreeFunction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Number of Diabetic people in family',
            style: TextStyle(
              fontSize: 21.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            '(Relations represent total count of relations, diabetic/non-diabetic)',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13.0),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const DiabeticCount(),
      ],
    );
  }
}
