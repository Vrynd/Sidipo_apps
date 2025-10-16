import 'package:flutter/material.dart';

class VillageIdentity {
  final TextEditingController nameController;
  final TextEditingController nikController;
  final TextEditingController nomorBpjsController;
  final TextEditingController birthDateController;
  final TextEditingController addressController;
  final TextEditingController rtController;
  final TextEditingController rwController;
  final TextEditingController noHpController;

  String? selectedBpjs;
  String? selectedGender;
  String? selectedStatus;
  String? selectedWork;

  VillageIdentity({
    required this.nameController,
    required this.nikController,
    required this.nomorBpjsController,
    required this.birthDateController,
    required this.addressController,
    required this.rtController,
    required this.rwController,
    required this.noHpController,
    this.selectedBpjs,
    this.selectedGender,
    this.selectedStatus,
    this.selectedWork,
  });

  void clear() {
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

  Map<String, dynamic> toJson() {
    return {
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
}
