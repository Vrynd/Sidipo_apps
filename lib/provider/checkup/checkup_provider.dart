import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/models/data/pregnant_mother.dart';

class CheckUpProvider extends ChangeNotifier {
  final PregnantMother mother = PregnantMother();

  double _progress = 0.0;
  double get progress => _progress;

  CheckUpProvider() {
    _listenToAllControllers();
  }

  void _listenToAllControllers() {
    mother.husbandNameController.addListener(onFieldChanged);
    mother.weightController.addListener(onFieldChanged);
    mother.heightController.addListener(onFieldChanged);
    mother.visitTimeController.addListener(onFieldChanged);
    mother.pregnancyAgeController.addListener(onFieldChanged);
    mother.weightPrenancyController.addListener(onFieldChanged);
    mother.lilaController.addListener(onFieldChanged);
    mother.bloodPresureController.addListener(onFieldChanged);
  }

  void _updateProgress() {
    int totalFields = 17;
    int filledFields = 0;

    if (mother.husbandNameController.text.isNotEmpty) filledFields++;
    if (mother.weightController.text.isNotEmpty) filledFields++;
    if (mother.heightController.text.isNotEmpty) filledFields++;
    if (mother.visitTimeController.text.isNotEmpty) filledFields++;
    if (mother.pregnancyAgeController.text.isNotEmpty) filledFields++;
    if (mother.weightPrenancyController.text.isNotEmpty) filledFields++;
    if (mother.lilaController.text.isNotEmpty) filledFields++;
    if (mother.bloodPresureController.text.isNotEmpty) filledFields++;

    if (mother.addBlood != null) filledFields++;
    if (mother.breastMilk != null) filledFields++;
    if (mother.pregnantMonther != null) filledFields++;
    if (mother.pregnancyClass != null) filledFields++;
    if (mother.healthCentre != null) filledFields++;
    if (mother.childDistance != null) filledFields++;
    if (mother.pregnantTo != null) filledFields++;

    if (mother.screeningTbc.isNotEmpty) filledFields++;
    if (mother.education.isNotEmpty) filledFields++;

    _progress = (filledFields / totalFields).clamp(0.0, 1.0);
  }

  void onFieldChanged() {
    _updateProgress();
    notifyListeners();
  }

  void setChildDistance(String? value) {
    mother.childDistance = value;
    onFieldChanged();
  }

  void setPregnantTo(String? value) {
    mother.pregnantTo = value;
    onFieldChanged();
  }

  void setAddBlood(String? value) {
    mother.addBlood = value;
    onFieldChanged();
  }

  void setBreastMilk(String? value) {
    mother.breastMilk = value;
    onFieldChanged();
  }

  void setPregnantMother(String? value) {
    mother.pregnantMonther = value;
    onFieldChanged();
  }

  void setPregnancyClass(String? value) {
    mother.pregnancyClass = value;
    onFieldChanged();
  }

  void setHealthCentre(String? value) {
    mother.healthCentre = value;
    onFieldChanged();
  }

  void setScreeningTbc(List<String> values) {
    mother.screeningTbc = values;
    onFieldChanged();
  }

  void setEducation(List<String> values) {
    mother.education = values;
    onFieldChanged();
  }

  void resetForm() {
    mother.clear();
    _updateProgress();
    notifyListeners();
  }

  @override
  void dispose() {
    mother.dispose();
    super.dispose();
  }
}
