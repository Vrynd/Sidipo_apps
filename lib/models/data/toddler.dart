import 'package:flutter/widgets.dart';

class Toddler {
  final TextEditingController oldNameToddlerController =
      TextEditingController();
  final TextEditingController newNameToddlerController =
      TextEditingController();
  final TextEditingController parenNameController = TextEditingController();
  final TextEditingController visitTimeController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController bodyLengthController = TextEditingController();
  final TextEditingController headController = TextEditingController();
  final TextEditingController armController = TextEditingController();

  String? conclusionWeight;
  String? indicationIllness;
  String? healthCentre;

  List<String> screeningTbc = [];
  List<String> obtain = [];
  List<String> education = [];

  void clear() {
    for (final controller in [
      oldNameToddlerController,
      newNameToddlerController,
      parenNameController,
      ageController,
      weightController,
      bodyLengthController,
      headController,
      armController,
    ]) {
      controller.clear();
    }

    conclusionWeight = null;
    indicationIllness = null;
    healthCentre = null;

    screeningTbc.clear();
    obtain.clear();
    education.clear();
  }

  void dispose() {
    for (final controller in [
      oldNameToddlerController,
      newNameToddlerController,
      parenNameController,
      ageController,
      weightController,
      bodyLengthController,
      headController,
      armController,
    ]) {
      controller.dispose();
    }
  }
}
