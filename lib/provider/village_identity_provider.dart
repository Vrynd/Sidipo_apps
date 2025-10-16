import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/models/village_identity.dart';

class VillageIdentityProvider extends ChangeNotifier {
  final VillageIdentity identity = VillageIdentity(
    nameController: TextEditingController(),
    nikController: TextEditingController(),
    nomorBpjsController: TextEditingController(),
    birthDateController: TextEditingController(),
    addressController: TextEditingController(),
    rtController: TextEditingController(),
    rwController: TextEditingController(),
    noHpController: TextEditingController(),
  );

  void setBpjs(String? value) {
    identity.selectedBpjs = value;
    notifyListeners();
  }

  void setGender(String? value) {
    identity.selectedGender = value;
    notifyListeners();
  }

  void setStatus(String? value) {
    identity.selectedStatus = value;
    notifyListeners();
  }

  void setWork(String? value) {
    identity.selectedWork = value;
    notifyListeners();
  }

  void clearForm() {
    identity.clear();
    notifyListeners();
  }

  /// Konversi data ke json, ketika ingin menyimpan data ke backend
  Map<String, dynamic> get toJson => identity.toJson();

  @override
  void dispose() {
    identity.dispose();
    super.dispose();
  }
}
