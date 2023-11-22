import 'dart:convert';
import 'package:careplus/networking/api.dart';
import 'package:careplus/data/patient_medical_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:careplus/conduct_test/sections/physical_info.dart';
import 'package:careplus/conduct_test/sections/diabetes_pedigree_function.dart';
import 'package:careplus/conduct_test/sections/blood_test_results.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../generate_result/result_screen.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key, required this.title});
  final String title;

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  dynamic response;
  bool showProgress = false;

  void navigate(bool isDiabetic, dynamic patientReport) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          title: 'Conduct another Test',
          diabetic: isDiabetic,
          patientReport: patientReport,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PatientInfo>(
      create: (context) => PatientInfo(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: ModalProgressHUD(
          inAsyncCall: showProgress,
          child: ListView(
            children: const [
              Column(
                children: <Widget>[
                  PhysicalInfo(),
                  Divider(),
                  BloodTestInfo(),
                  Divider(),
                  DiabetesPedigreeFunction(),
                  SizedBox(height: 75.0),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: Consumer<PatientInfo>(
          builder: (context, patientInfo, Widget? child) {
            dynamic patientReport;

            return FloatingActionButton(
              backgroundColor: patientInfo.valid
                  ? Theme.of(context).colorScheme.inversePrimary
                  : Colors.grey,
              onPressed: patientInfo.valid
                  ? () async {
                      try {
                        setState(() {
                          showProgress = true;
                        });
                        // Make an API call
                        response = await getData(
                          pregnancies: patientInfo.numberOfPregnancies,
                          bloodPressure: patientInfo.bloodPressure,
                          glucose: patientInfo.glucose,
                          skinThickness: patientInfo.skinThickness,
                          insulin: patientInfo.insulin,
                          bmi: patientInfo.bmi,
                          dpf: patientInfo.dpf,
                          age: patientInfo.age,
                        );
                        patientReport = jsonDecode(response);
                        if (kDebugMode) {
                          print(patientReport);
                        }
                      } catch (e) {
                        if (kDebugMode) {
                          print(e);
                        }
                      }
                      setState(() {
                        showProgress = false;
                      });

                      try {
                        navigate(patientReport['diabetic'], patientInfo);
                      } catch (e) {
                        if (kDebugMode) {
                          print(e);
                        }
                      }
                    }
                  : () {
                      if (kDebugMode) {
                        print('Input error!');
                      }
                    },
              tooltip: 'Conduct Test',
              child: const Icon(
                CupertinoIcons.lab_flask,
                size: 30.0,
              ),
            );
          },
        ),
      ),
    );
  }
}
