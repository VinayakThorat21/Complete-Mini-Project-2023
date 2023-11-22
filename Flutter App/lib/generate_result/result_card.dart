import 'package:flutter/material.dart';
import 'report.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
    this.patientReport,
  });

  final dynamic patientReport;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Report(patientReport: patientReport),
      ),
    );
  }
}
