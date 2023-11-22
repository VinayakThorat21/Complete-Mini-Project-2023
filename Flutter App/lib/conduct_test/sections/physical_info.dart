import 'package:careplus/data/patient_medical_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'packets/datagram.dart';

class PhysicalInfo extends StatelessWidget {
  const PhysicalInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Physical Information',
            style: TextStyle(
              fontSize: 21.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ),
        Datagram(
          label: 'Age (in years)',
          onInput: (value) {
            try {
              Provider.of<PatientInfo>(context, listen: false).age =
                  int.parse(value);
              Provider.of<PatientInfo>(context, listen: false)
                  .setValid(true, 0);
            } catch (e) {
              if (kDebugMode) {
                print(e);
                Provider.of<PatientInfo>(context, listen: false)
                    .setValid(false, 0);
              }
            }
          },
        ),
        Datagram(
          label: 'Weight (in kg)',
          onInput: (value) {
            try {
              Provider.of<PatientInfo>(context, listen: false).weight =
                  double.parse(value);
              Provider.of<PatientInfo>(context, listen: false)
                  .setValid(true, 1);
            } catch (e) {
              if (kDebugMode) {
                print(e);
                Provider.of<PatientInfo>(context, listen: false)
                    .setValid(false, 1);
              }
            }
          },
        ),
        Datagram(
          label: 'Height (in cm)',
          onInput: (value) {
            try {
              Provider.of<PatientInfo>(context, listen: false).height =
                  double.parse(value);
              Provider.of<PatientInfo>(context, listen: false)
                  .setValid(true, 2);
            } catch (e) {
              if (kDebugMode) {
                print(e);
                Provider.of<PatientInfo>(context, listen: false)
                    .setValid(false, 2);
              }
            }
          },
        ),
        Datagram(
          label: 'Number of Pregnancies',
          onInput: (value) {
            try {
              Provider.of<PatientInfo>(context, listen: false)
                  .numberOfPregnancies = int.parse(value);
              Provider.of<PatientInfo>(context, listen: false)
                  .setValid(true, 3);
            } catch (e) {
              if (kDebugMode) {
                print(e);
                Provider.of<PatientInfo>(context, listen: false)
                    .setValid(false, 3);
              }
            }
          },
        ),
      ],
    );
  }
}
