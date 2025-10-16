import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/models/village_identity.dart';

class VillageIdentityProvider extends ChangeNotifier {
  VillageIdentity get identity => _identity;

  final VillageIdentity _identity = VillageIdentity(
    nameController: TextEditingController(),
    nikController: TextEditingController(),
    nomorBpjsController: TextEditingController(),
    birthDateController: TextEditingController(),
    addressController: TextEditingController(),
    rtController: TextEditingController(),
    rwController: TextEditingController(),
    noHpController: TextEditingController(),
  );

  double get progress {
    final fields = [
      _identity.nameController.text,
      _identity.nikController.text,
      _identity.nomorBpjsController.text,
      _identity.birthDateController.text,
      _identity.addressController.text,
      _identity.rtController.text,
      _identity.rwController.text,
      _identity.noHpController.text,
      _identity.selectedBpjs,
      _identity.selectedGender,
      _identity.selectedStatus,
      _identity.selectedWork,
    ];

    final filled = fields
        .where((value) => value != null && value.toString().trim().isNotEmpty)
        .length;
    return filled / fields.length;
  }

  void setBpjs(String? value) {
    _identity.selectedBpjs = value;
    notifyListeners();
  }

  void setGender(String? value) {
    _identity.selectedGender = value;
    notifyListeners();
  }

  void setStatus(String? value) {
    _identity.selectedStatus = value;
    notifyListeners();
  }

  void setWork(String? value) {
    _identity.selectedWork = value;
    notifyListeners();
  }

  void onFieldChanged() => notifyListeners();

  void clearForm() {
    _identity.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    identity.dispose();
    super.dispose();
  }
}
