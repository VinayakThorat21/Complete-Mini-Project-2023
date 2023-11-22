import 'package:flutter/cupertino.dart';

class PatientInfo extends ChangeNotifier {
  late int age, numberOfPregnancies;
  late double height, weight;
  List<bool> validity = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  late double glucose, bloodPressure, insulin, skinThickness;
  late int parents = 0,
      grandParents = 0,
      auntUncle = 0,
      siblings = 0,
      firstCousins = 0,
      relativesCount = 4;

  // Getter for BMI and DPF
  double get dpf {
    return (((parents + grandParents + auntUncle + siblings + firstCousins) /
            relativesCount) *
        (0.5 * parents +
            0.25 * grandParents +
            0.125 * (auntUncle + siblings) +
            0.0625 * firstCousins));
  }

  double get bmi {
    double meterHeight = height / 100;
    return (weight / (meterHeight * meterHeight));
  }

  bool get valid {
    bool value = true;
    for (int i = 0; i < validity.length; i++) {
      value = validity[i] && value;
    }
    return value;
  }

  void setValid(bool value, int i) {
    validity[i] = value;
    notifyListeners();
  }

  void relationDecrement(String relation) {
    switch (relation.toLowerCase()) {
      case 'parent':
        if (parents > 0) parents--;
        break;

      case 'grandparent':
        if (grandParents > 0) grandParents--;
        break;

      case 'auntuncle':
        if (auntUncle > 0) {
          auntUncle--;
          relativesCount--;
        }
        break;

      case 'sibling':
        if (siblings > 0) {
          siblings--;
          relativesCount--;
        }
        break;

      case 'firstcousin':
        if (firstCousins > 0) {
          firstCousins--;
          relativesCount--;
        }
        break;

      case 'relatives':
        if (relativesCount > (4 + auntUncle + siblings + firstCousins)) {
          relativesCount--;
        }
        break;
    }
    notifyListeners();
  }

  void relationIncrement(String relation) {
    switch (relation.toLowerCase()) {
      case 'parent':
        if (parents < 2) parents++;

        break;

      case 'grandparent':
        if (grandParents < 2) grandParents++;
        break;

      case 'auntuncle':
        auntUncle++;
        relativesCount++;
        break;

      case 'sibling':
        siblings++;
        relativesCount++;
        break;

      case 'firstcousin':
        firstCousins++;
        relativesCount++;
        break;

      case 'relatives':
        relativesCount++;
        break;
    }
    notifyListeners();
  }
}
