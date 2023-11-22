import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'result_card.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key,
      required this.title,
      required this.diabetic,
      this.patientReport});
  final String title;
  final bool diabetic;
  final dynamic patientReport;

  @override
  Widget build(BuildContext context) {
    return Provider<bool>(
      create: (context) => diabetic,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: ResultCard(patientReport: patientReport),
      ),
    );
  }
}
