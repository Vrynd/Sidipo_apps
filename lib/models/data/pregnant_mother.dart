import 'package:flutter/material.dart';

class PregnantMother {
  final TextEditingController husbandNameController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController visitTimeController = TextEditingController();
  final TextEditingController pregnancyAgeController = TextEditingController();
  final TextEditingController weightPrenancyController = TextEditingController();
  final TextEditingController lilaController = TextEditingController();
  final TextEditingController bloodPresureController = TextEditingController();

  String? childDistance;
  String? pregnantTo;
  String? addBlood;
  String? breastMilk;
  String? pregnantMonther;
  String? pregnancyClass;
  String? healthCentre;

  List<String> screeningTbc = [];
  List<String> education = [];

  PregnantMother();

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
