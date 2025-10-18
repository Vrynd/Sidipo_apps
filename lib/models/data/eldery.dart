import 'package:flutter/material.dart';

class Eldery {
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
  String? bowelControl;
  String? urinaryControl;
  String? personalHygiene;
  String? toiletUse;
  String? eatingDrinking;
  String? movingFromWheelchair;
  String? walkingFlatSurface;
  String? climbingStairs;
  String? levelDepedency;

  List<String> familyMedicalHistory = [];
  List<String> personalMedicalHistory = [];
  List<String> highSugar = [];
  List<String> highSalt = [];
  List<String> highFat = [];
  List<String> education = [];
  List<String> screeningTbc = [];

  Eldery();

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
    bowelControl = null;
    urinaryControl = null;
    personalHygiene = null;
    toiletUse = null;
    eatingDrinking = null;
    movingFromWheelchair = null;
    walkingFlatSurface = null;
    climbingStairs = null;
    levelDepedency = null;

    familyMedicalHistory.clear();
    personalMedicalHistory.clear();
    highSugar.clear();
    highSalt.clear();
    highFat.clear();
    screeningTbc.clear();
    education.clear();
  }
}
