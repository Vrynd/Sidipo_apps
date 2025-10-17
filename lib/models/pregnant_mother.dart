import 'package:flutter/material.dart';

class PregnantMother {
  final TextEditingController husbandNameController;
  final TextEditingController weightController;
  final TextEditingController heightController;
  final TextEditingController visitTimeController;
  final TextEditingController pregnancyAgeController;
  final TextEditingController weightPrenancyController;
  final TextEditingController lilaController;
  final TextEditingController bloodPresureController;

  String? childDistance;
  String? pregnantTo;
  String? addBlood;
  String? breastMilk;
  String? pregnantMonther;
  String? pregnancyClass;
  String? healthCentre;

  List<String> screeningTbc = [];
  List<String> education = [];

  PregnantMother({
    required this.husbandNameController,
    required this.weightController,
    required this.heightController,
    required this.visitTimeController,
    required this.pregnancyAgeController,
    required this.weightPrenancyController,
    required this.lilaController,
    required this.bloodPresureController,
    this.childDistance,
    this.pregnantTo,
    this.addBlood,
    this.breastMilk,
    this.pregnantMonther,
    this.pregnancyClass,
    this.healthCentre,
    this.screeningTbc = const [],
    this.education = const [],
  });

  void clear() {
    for (final controller in [
      husbandNameController,
      weightController,
      heightController,
      visitTimeController,
      pregnancyAgeController,
      weightPrenancyController,
      lilaController,
      bloodPresureController,
    ]) {
      controller.clear();
    }

    childDistance = null;
    pregnantTo = null;
    addBlood = null;
    breastMilk = null;
    pregnantMonther = null;
    pregnancyClass = null;
    healthCentre = null;

    screeningTbc.clear();
    education.clear();
  }

  void dispose() {
    for (final controller in [
      husbandNameController,
      weightController,
      heightController,
      visitTimeController,
      pregnancyAgeController,
      weightPrenancyController,
      lilaController,
      bloodPresureController,
    ]) {
      controller.dispose();
    }
  }
}
