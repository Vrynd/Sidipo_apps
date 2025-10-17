import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/provider/checkup/checkup_provider.dart';
import 'package:posyandu_digital_app/ui/widget/main/choice_data_app.dart';
import 'package:posyandu_digital_app/ui/widget/main/input_data_app.dart';
import 'package:posyandu_digital_app/ui/widget/main/select_data_app.dart';
import 'package:provider/provider.dart';

class CheckupFormApp extends StatelessWidget {
  const CheckupFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckUpProvider>(
      builder: (context, provider, child) {
        final identity = provider.mother;

        return Column(
          children: [
            InputDataApp(
              isRequired: true,
              controller: identity.husbandNameController,
              title: 'Nama Pasangan',
              hintText: 'Masukkan nama pasangan',
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              onChanged: (_) => provider.onFieldChanged(),
            ),
            ChoiceDataApp(
              isRequired: true,
              title: 'Jarak Dengan Anak Sebelumnya',
              options: [
                '1 Tahun',
                '2 Tahun',
                '3 Tahun',
                '4 Tahun',
                'Lebih 4 Tahun',
              ],
              selectedValue: identity.childDistance,
              onChanged: (value) => provider.setChildDistance(value!),
            ),
            ChoiceDataApp(
              isRequired: true,
              title: 'Kehamilan Anak Keberapa',
              options: ['1', '2', '3', '4', 'Lebih Dari 4'],
              selectedValue: identity.pregnantTo,
              onChanged: (value) => provider.setPregnantTo(value!),
            ),
            InputDataApp(
              isRequired: true,
              controller: identity.weightController,
              title: 'Berat Badan Sebelum Hamil',
              hintText: 'Masukkan berat badan (kg)',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              onChanged: (_) => provider.onFieldChanged(),
            ),
            InputDataApp(
              isRequired: true,
              controller: identity.heightController,
              title: 'Tinggi Badan',
              hintText: 'Masukkan tiinggi badan (cm)',
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              onChanged: (_) => provider.onFieldChanged(),
            ),
            InputDataApp(
              isRequired: true,
              controller: identity.visitTimeController,
              title: 'Waktu Kunjungan',
              hintText: 'Masukkan waktu kunjungan',
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.datetime,
              onChanged: (_) => provider.onFieldChanged(),
            ),
            InputDataApp(
              isRequired: true,
              controller: identity.pregnancyAgeController,
              title: 'Masukkan Usia Kehamilan',
              hintText: 'Masukkan usia kehamilan (minggu)',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              onChanged: (_) => provider.onFieldChanged(),
            ),
            InputDataApp(
              isRequired: true,
              controller: identity.weightPrenancyController,
              title: 'Berat Badan',
              hintText: 'Masukkan berat badan (kg)',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              onChanged: (_) => provider.onFieldChanged(),
            ),
            InputDataApp(
              isRequired: true,
              controller: identity.lilaController,
              title: 'Lingkar Lengan Atas',
              hintText: 'Masukkan lingkar lengan atas (cm)',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              onChanged: (_) => provider.onFieldChanged(),
            ),
            InputDataApp(
              isRequired: true,
              controller: identity.bloodPresureController,
              title: 'Tekanan Darah',
              hintText: 'Masukkan tekanan darah (mmHg)',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              onChanged: (_) => provider.onFieldChanged(),
            ),
            SelectDataApp(
              isRequired: true,
              title: 'Skrining TBC',
              options: ['Batuk Lama', 'BB Turun', 'Berkeringat Malam', 'Demam'],
              selectedValues: identity.screeningTbc,
              onChanged: (List<String> selectedValues) {
                provider.setScreeningTbc(selectedValues);
              },
            ),
            ChoiceDataApp(
              isRequired: true,
              title: 'Pemberian Tablet Tambah Darah',
              options: ['Ya', 'Tidak'],
              selectedValue: identity.addBlood,
              onChanged: (value) => provider.setAddBlood(value!),
            ),
            ChoiceDataApp(
              isRequired: true,
              title: 'Ibu Memberikan Asi Eksklusif',
              options: ['Ya', 'Tidak'],
              selectedValue: identity.breastMilk,
              onChanged: (value) => provider.setBreastMilk(value!),
            ),
            ChoiceDataApp(
              isRequired: true,
              title: 'Pemberian MT Ibu Hamil',
              options: ['Ya', 'Tidak'],
              selectedValue: identity.pregnantMonther,
              onChanged: (value) => provider.setPregnantMother(value!),
            ),
            ChoiceDataApp(
              isRequired: true,
              title: 'Kelas Ibu Hamil',
              options: ['Ya', 'Tidak'],
              selectedValue: identity.pregnancyClass,
              onChanged: (value) => provider.setPregnancyClass(value!),
            ),
            SelectDataApp(
              isRequired: true,
              title: 'Penyuluhan',
              options: [
                'Isi Piringku',
                'Anjuran Minum TTD',
                'Pemantauan Tanda Bahaya',
              ],
              selectedValues: identity.education,
              onChanged: (List<String> selectedValues) {
                provider.setEducation(selectedValues);
              },
            ),
            ChoiceDataApp(
              isRequired: true,
              title: 'Rujuk Ke Puskemas atau Pustu',
              options: ['Ya', 'Tidak'],
              selectedValue: identity.healthCentre,
              onChanged: (value) => provider.setHealthCentre(value!),
            ),
          ],
        );
      },
    );
  }
}
