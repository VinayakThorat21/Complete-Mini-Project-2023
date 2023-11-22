import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const textStyle = TextStyle(
  fontSize: 17,
  color: Colors.indigo,
);

class Report extends StatelessWidget {
  const Report({
    Key? key,
    required this.patientReport,
  }) : super(key: key);

  final dynamic patientReport;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Image.asset(
          'assets/icon.png',
          height: 80,
          width: 80,
        ),
        const SizedBox(height: 10),
        const Text(
          'CarePlus Medical Report',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        Text(
          'Test results',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Diabetic Status: ${Provider.of<bool>(context) ? 'Active' : 'Safe'}',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Provider.of<bool>(context) ? Colors.red : Colors.green,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          Provider.of<bool>(context)
              ? 'Controlled diet and Medications under surveillance of a doctor is suggested!'
              : 'No need of medications or medical assistance, stay healthy.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
            color: Provider.of<bool>(context)
                ? Colors.redAccent
                : Colors.lightGreen,
          ),
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        Text(
          'Patient Information',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 20),
        Text('Age: ${patientReport.age}', style: textStyle),
        Text('Height: ${patientReport.height} cm', style: textStyle),
        Text('Weight: ${patientReport.weight} kg', style: textStyle),
        Text('BMI: ${patientReport.bmi.toStringAsFixed(2)} kg/sq m',
            style: textStyle),
        Text('DPF: ${patientReport.dpf.toStringAsFixed(2)}', style: textStyle),
      ],
    );
  }
}
