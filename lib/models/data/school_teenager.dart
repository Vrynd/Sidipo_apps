import 'package:flutter/material.dart';

class SchoolTeenager {
  final TextEditingController parentNameController = TextEditingController();
  final TextEditingController visitTimeController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController waistController = TextEditingController();
  final TextEditingController bloodSugarController = TextEditingController();

  String? bodyMask;
  String? hemoglobinLevels;
  String? feelComfortableAtHome;
  String? feelBurdenedAtSchool;
  String? likeYourBody;
  String? friendOutside;
  String? consumedAlcoholOrDrugs;
  String? sexualIntercourse;
  String? feelUnsafeAtSchoolOrComunity;
  String? commitingSuicide;
  String? healthCentre;

  List<String> familyMedicalHistory = [];
  List<String> selfRiskBehavior = [];
  List<String> screeningTbc = [];
  List<String> education = [];

  SchoolTeenager();
  void clear() {
    for (final controller in [
      parentNameController,
      visitTimeController,
      weightController,
      heightController,
      waistController,
      bloodSugarController,
    ]) {
      controller.clear();
    }

    bodyMask = null;
    hemoglobinLevels = null;
    feelComfortableAtHome = null;
    feelBurdenedAtSchool = null;
    likeYourBody = null;
    friendOutside = null;
    consumedAlcoholOrDrugs = null;
    sexualIntercourse = null;
    feelUnsafeAtSchoolOrComunity = null;
    commitingSuicide = null;
    healthCentre = null;

    familyMedicalHistory.clear();
    selfRiskBehavior.clear();
    screeningTbc.clear();
    education.clear();
  }
}
