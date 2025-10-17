import 'package:flutter/material.dart';

class VillageIdentity {
  // Controller input teks
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController nomorBpjsController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController rtController = TextEditingController();
  final TextEditingController rwController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();

  // Value dropdown
  String? selectedBpjs;
  String? selectedGender;
  String? selectedStatus;
  String? selectedWork;

  bool get isComplete {
    return nameController.text.isNotEmpty &&
        nikController.text.isNotEmpty &&
        selectedBpjs != null &&
        birthDateController.text.isNotEmpty &&
        selectedGender != null &&
        addressController.text.isNotEmpty &&
        rtController.text.isNotEmpty &&
        rwController.text.isNotEmpty &&
        selectedStatus != null &&
        selectedWork != null &&
        noHpController.text.isNotEmpty;
  }

  void reset() {
    nameController.clear();
    nikController.clear();
    nomorBpjsController.clear();
    birthDateController.clear();
    addressController.clear();
    rtController.clear();
    rwController.clear();
    noHpController.clear();
    selectedBpjs = null;
    selectedGender = null;
    selectedStatus = null;
    selectedWork = null;
  }

  void dispose() {
    nameController.dispose();
    nikController.dispose();
    nomorBpjsController.dispose();
    birthDateController.dispose();
    addressController.dispose();
    rtController.dispose();
    rwController.dispose();
    noHpController.dispose();
  }
}

class VillageIdentityProvider extends ChangeNotifier {
  final VillageIdentity identity = VillageIdentity();

  double _progress = 0.0;
  double get progress => _progress;

  VillageIdentityProvider() {
    _listenToAllControllers();
  }

  void _listenToAllControllers() {
    identity.nameController.addListener(onFieldChanged);
    identity.nikController.addListener(onFieldChanged);
    identity.nomorBpjsController.addListener(onFieldChanged);
    identity.birthDateController.addListener(onFieldChanged);
    identity.addressController.addListener(onFieldChanged);
    identity.rtController.addListener(onFieldChanged);
    identity.rwController.addListener(onFieldChanged);
    identity.noHpController.addListener(onFieldChanged);
  }

  void _updateProgress() {
    int totalFields = 12;
    int filledFields = 0;

    if (identity.nameController.text.isNotEmpty) filledFields++;
    if (identity.nikController.text.isNotEmpty) filledFields++;
    if (identity.selectedBpjs != null) filledFields++;
    if (identity.nomorBpjsController.text.isNotEmpty) filledFields++;
    if (identity.birthDateController.text.isNotEmpty) filledFields++;
    if (identity.selectedGender != null) filledFields++;
    if (identity.addressController.text.isNotEmpty) filledFields++;
    if (identity.rtController.text.isNotEmpty) filledFields++;
    if (identity.rwController.text.isNotEmpty) filledFields++;
    if (identity.selectedStatus != null) filledFields++;
    if (identity.selectedWork != null) filledFields++;
    if (identity.noHpController.text.isNotEmpty) filledFields++;

    _progress = (filledFields / totalFields).clamp(0.0, 1.0);
  }

  void onFieldChanged() {
    _updateProgress();
    notifyListeners();
  }

  void setBpjs(String value) {
    identity.selectedBpjs = value;
    onFieldChanged();
  }

  void setGender(String value) {
    identity.selectedGender = value;
    onFieldChanged();
  }

  void setStatus(String value) {
    identity.selectedStatus = value;
    onFieldChanged();
  }

  void setWork(String value) {
    identity.selectedWork = value;
    onFieldChanged();
  }

  void resetForm() {
    identity.reset();
    _updateProgress();
    notifyListeners();
  }

  @override
  void dispose() {
    identity.dispose();
    super.dispose();
  }
}
