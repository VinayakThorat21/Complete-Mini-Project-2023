import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/*
0,118.0,84.0,47.0,230.0,45.8,0.551,31,1
7,107.0,74.0,29.0,125.0,29.6,0.254,31,1
1,115.0,70.0,30.0,96.0,34.6,0.529,32,1
1,103.0,30.0,38.0,83.0,43.3,0.183,33,0
2,99.0,52.0,15.0,94.0,24.6,0.637,21,0
1,109.0,56.0,21.0,135.0,25.2,0.833,23,0
 */

// Android emulator uses 10.0.2.2 as an alias to the localhost
String host = 'mlgeek21.pythonanywhere.com', path = '/predict';

Future getData(
    {required int pregnancies,
    required double glucose,
    required double bloodPressure,
    required double skinThickness,
    required double insulin,
    required double bmi,
    required double dpf,
    required int age}) async {
  var url = Uri.http(host, path, {
    'pregnancies': pregnancies.toString(),
    'glucose': glucose.toString(),
    'blood_pressure': bloodPressure.toString(),
    'skin_thickness': skinThickness.toString(),
    'insulin': insulin.toString(),
    'bmi': bmi.toString(),
    'dpf': dpf.toString(),
    'age': age.toString()
  });

  if (kDebugMode) {
    print('Attempt started');
  }
  http.Response response = await http.get(url);
  if (kDebugMode) {
    print('Attempt completed');
  }
  return response.body;
}
