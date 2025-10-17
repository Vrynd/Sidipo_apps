import 'package:flutter/material.dart';

class Resident {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController nomorBpjsController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController rtController = TextEditingController();
  final TextEditingController rwController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();

  String? selectedBpjs;
  String? selectedGender;
  String? selectedStatus;
  String? selectedWork;

  Resident();

  void clear() {
    for (final controller in [
      nameController,
      nikController,
      nomorBpjsController,
      birthDateController,
      addressController,
      rtController,
      rwController,
      noHpController,
    ]) {
      controller.clear();
    }

    selectedBpjs = null;
    selectedGender = null;
    selectedStatus = null;
    selectedWork = null;
  }

  void dispose() {
    for (final controller in [
      nameController,
      nikController,
      nomorBpjsController,
      birthDateController,
      addressController,
      rtController,
      rwController,
      noHpController,
    ]) {
      controller.dispose();
    }
  }

  Map<String, dynamic> toJson() => {
        'nama': nameController.text,
        'nik': nikController.text,
        'nomorBpjs': nomorBpjsController.text,
        'tanggalLahir': birthDateController.text,
        'alamat': addressController.text,
        'rt': rtController.text,
        'rw': rwController.text,
        'noHp': noHpController.text,
        'bpjs': selectedBpjs,
        'gender': selectedGender,
        'status': selectedStatus,
        'pekerjaan': selectedWork,
      };
}
