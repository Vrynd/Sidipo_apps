import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/models/data/redisent.dart';

class ResidentProvider extends ChangeNotifier {
  final Resident resident = Resident();

  double _progress = 0.0;
  double get progress => _progress;

  ResidentProvider() {
    _listenToControllers();
  }

  void _listenToControllers() {
    for (final controller in [
      resident.nameController,
      resident.nikController,
      resident.nomorBpjsController,
      resident.birthDateController,
      resident.addressController,
      resident.rtController,
      resident.rwController,
      resident.noHpController,
    ]) {
      controller.addListener(onFieldChanged);
    }
  }

  void onFieldChanged() {
    _updateProgress();
    notifyListeners();
  }

  void _updateProgress() {
    final totalFields = 12;
    int filled = 0;

    if (resident.nameController.text.isNotEmpty) filled++;
    if (resident.nikController.text.isNotEmpty) filled++;
    if (resident.selectedBpjs != null) filled++;
    if (resident.nomorBpjsController.text.isNotEmpty) filled++;
    if (resident.birthDateController.text.isNotEmpty) filled++;
    if (resident.selectedGender != null) filled++;
    if (resident.addressController.text.isNotEmpty) filled++;
    if (resident.rtController.text.isNotEmpty) filled++;
    if (resident.rwController.text.isNotEmpty) filled++;
    if (resident.selectedStatus != null) filled++;
    if (resident.selectedWork != null) filled++;
    if (resident.noHpController.text.isNotEmpty) filled++;

    _progress = (filled / totalFields).clamp(0.0, 1.0);
  }

  void setBpjs(String value) {
    resident.selectedBpjs = value;
    onFieldChanged();
  }

  void setGender(String value) {
    resident.selectedGender = value;
    onFieldChanged();
  }

  void setStatus(String value) {
    resident.selectedStatus = value;
    onFieldChanged();
  }

  void setWork(String value) {
    resident.selectedWork = value;
    onFieldChanged();
  }

  void resetForm() {
    resident.clear();
    _updateProgress();
    notifyListeners();
  }

  @override
  void dispose() {
    resident.dispose();
    super.dispose();
  }
}
