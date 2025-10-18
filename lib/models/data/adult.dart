import 'package:flutter/material.dart';

class Adult {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController visitTimeController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController waistController = TextEditingController();
  final TextEditingController bloodPressureController = TextEditingController();
  final TextEditingController bloodSugarController = TextEditingController();
  final TextEditingController uridAcidController = TextEditingController();
  final TextEditingController cholestrolController = TextEditingController();

  String? smoking;
  String? bodyMask;
  String? eyeTest;
  String? earTest;
  String? shortnessOfBreath;
  String? phlegmFromLungs;
  String? usuallyCough;
  String? spirometryTesting;
  String? scorePuma;
  String? contraceptiveMethod;
  String? healthCentre;

  List<String> familyMedicalHistory = [];
  List<String> personalMedicalHistory = [];
  List<String> highSugar = [];
  List<String> highSalt = [];
  List<String> highFat = [];
  List<String> education = [];
  List<String> screeningTbc = [];

  Adult();

  void clear() {
    for (final controller in [
      ageController,
      visitTimeController,
      weightController,
      heightController,
      waistController,
      bloodPressureController,
      bloodSugarController,
      uridAcidController,
      cholestrolController,
    ]) {
      controller.clear();
    }

    bodyMask = null;
    eyeTest = null;
    earTest = null;
    shortnessOfBreath = null;
    phlegmFromLungs = null;
    usuallyCough = null;
    spirometryTesting = null;
    scorePuma = null;
    contraceptiveMethod = null;
    healthCentre = null;

    familyMedicalHistory.clear();
    personalMedicalHistory.clear();
    highSugar.clear();
    highSalt.clear();
    highFat.clear();
    screeningTbc.clear();
    education.clear();
  }
}
