import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/models/pregnant_mother.dart';

class PregnantMotherProvider extends ChangeNotifier {
  PregnantMother get mother => _mother;

  final PregnantMother _mother = PregnantMother(
    husbandNameController: TextEditingController(),
    weightController: TextEditingController(),
    heightController: TextEditingController(),
    visitTimeController: TextEditingController(),
    pregnancyAgeController: TextEditingController(),
    weightPrenancyController: TextEditingController(),
    lilaController: TextEditingController(),
    bloodPresureController: TextEditingController(),
  );

  double get progress {
    final fields = [
      _mother.husbandNameController.text,
      _mother.weightController.text,
      _mother.heightController.text,
      _mother.visitTimeController.text,
      _mother.pregnancyAgeController.text,
      _mother.weightPrenancyController.text,
      _mother.lilaController.text,
      _mother.bloodPresureController.text,
      _mother.addBlood,
      _mother.breastMilk,
      _mother.pregnantMonther,
      _mother.pregnancyClass,
      _mother.healthCentre,
      _mother.screeningTbc.isNotEmpty ? 'filled' : '',
      _mother.education.isNotEmpty ? 'filled' : '',
    ];

    final filled = fields
        .where((value) => value != null && value.toString().trim().isNotEmpty)
        .length;

    return filled / fields.length;
  }

  void setChildDistance(String? value) {
    _mother.childDistance = value;
    notifyListeners();
  }

  void setPregnantTo(String? value) {
    _mother.pregnantTo = value;
    notifyListeners();
  }

  void setAddBlood(String? value) {
    _mother.addBlood = value;
    notifyListeners();
  }

  void setBreastMilk(String? value) {
    _mother.breastMilk = value;
    notifyListeners();
  }

  void setPregnantMother(String? value) {
    _mother.pregnantMonther = value;
    notifyListeners();
  }

  void setPregnancyClass(String? value) {
    _mother.pregnancyClass = value;
    notifyListeners();
  }

  void setHealthCentre(String? value) {
    _mother.healthCentre = value;
    notifyListeners();
  }

  void toggleScreeningTbc(String value, bool selected) {
    if (selected) {
      _mother.screeningTbc.add(value);
    } else {
      _mother.screeningTbc.remove(value);
    }
    notifyListeners();
  }

  void toggleEducation(String value, bool selected) {
    if (selected) {
      _mother.education.add(value);
    } else {
      _mother.education.remove(value);
    }
    notifyListeners();
  }

  void onFieldChanged() => notifyListeners();

  // Reset semua data
  void clearForm() {
    _mother.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    _mother.dispose();
    super.dispose();
  }
}
