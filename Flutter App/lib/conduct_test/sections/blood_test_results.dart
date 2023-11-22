import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/patient_medical_info.dart';
import 'packets/datagram.dart';

class BloodTestInfo extends StatelessWidget {
  const BloodTestInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Blood Report',
            style: TextStyle(
              fontSize: 21.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ),
        Datagram(
          label: 'Glucose (mg/dL)',
          onInput: (value) {
            try {
              Provider.of<PatientInfo>(context, listen: false).glucose =
                  double.parse(value);
              Provider.of<PatientInfo>(context, listen: false)
                  .setValid(true, 4);
            } catch (e) {
              if (kDebugMode) {
                print(e);
                Provider.of<PatientInfo>(context, listen: false)
                    .setValid(false, 4);
              }
            }
          },
        ),
        Datagram(
          label: 'Blood Pressure (mmHg)',
          onInput: (value) {
            try {
              Provider.of<PatientInfo>(context, listen: false).bloodPressure =
                  double.parse(value);
              Provider.of<PatientInfo>(context, listen: false)
                  .setValid(true, 5);
            } catch (e) {
              if (kDebugMode) {
                print(e);
                Provider.of<PatientInfo>(context, listen: false)
                    .setValid(false, 5);
              }
            }
          },
        ),
        Datagram(
          label: 'Insulin (μU/mL)',
          onInput: (value) {
            try {
              Provider.of<PatientInfo>(context, listen: false).insulin =
                  double.parse(value);
              Provider.of<PatientInfo>(context, listen: false)
                  .setValid(true, 6);
            } catch (e) {
              if (kDebugMode) {
                print(e);
                Provider.of<PatientInfo>(context, listen: false)
                    .setValid(false, 6);
              }
            }
          },
        ),
        Datagram(
          label: 'Skin thickness (mm)',
          onInput: (value) {
            try {
              Provider.of<PatientInfo>(context, listen: false).skinThickness =
                  double.parse(value);
              Provider.of<PatientInfo>(context, listen: false)
                  .setValid(true, 7);
            } catch (e) {
              if (kDebugMode) {
                print(e);
                Provider.of<PatientInfo>(context, listen: false)
                    .setValid(false, 7);
              }
            }
          },
        ),
      ],
    );
  }
}
