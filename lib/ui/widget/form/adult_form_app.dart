import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/models/data/toddler.dart';
import 'package:posyandu_digital_app/ui/widget/main/choice_data_app.dart';
import 'package:posyandu_digital_app/ui/widget/main/input_data_app.dart';
import 'package:posyandu_digital_app/ui/widget/main/select_data_app.dart';

class AdultFormApp extends StatelessWidget {
  const AdultFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Toddler toddler = Toddler();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InputDataApp(
          isRequired: true,
          controller: toddler.oldNameToddlerController,
          title: 'Nama Balita',
          hintText: 'Masukkan nama balita sesuai KTP',
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          onChanged: null,
        ),
        InputDataApp(
          isRequired: true,
          controller: toddler.newNameToddlerController,
          title: 'Nama Balita Baru',
          hintText: 'Masukkan nama balita sesuai KTP',
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          onChanged: null,
        ),
        InputDataApp(
          isRequired: true,
          controller: toddler.ageController,
          title: 'Usia',
          hintText: 'Masukkan usia balita (bulan)',
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          onChanged: null,
        ),
        InputDataApp(
          isRequired: true,
          controller: toddler.parenNameController,
          title: 'Nama Orang Tua',
          hintText: 'Masukkan nama orang tua sesuai KTP',
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          onChanged: null,
        ),
        InputDataApp(
          isRequired: true,
          controller: toddler.visitTimeController,
          title: 'Waktu Kunjungan',
          hintText: 'Masukkan waktu kunjungan',
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.datetime,
          onChanged: null,
          onTap: () async {
            final pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );

            if (pickedDate != null) {
              toddler.visitTimeController.text =
                  "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
            }
          },
        ),
        InputDataApp(
          isRequired: true,
          controller: toddler.weightController,
          title: 'Berat Badan',
          hintText: 'Masukkan berat badan (kg)',
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          onChanged: null,
        ),
        ChoiceDataApp(
          isRequired: true,
          title: 'Kesimpulan Berat Badan',
          options: ['Naik', 'Tidak Naik', 'Bawah Garis Merah'],
          selectedValue: toddler.conclusionWeight,
          onChanged: (value) => toddler.conclusionWeight = value!,
        ),
        InputDataApp(
          isRequired: true,
          controller: toddler.bodyLengthController,
          title: 'Panjang Badan',
          hintText: 'Masukkan panjang badan (cm)',
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          onChanged: null,
        ),
        InputDataApp(
          isRequired: true,
          controller: toddler.headController,
          title: 'Lingkar Kepala',
          hintText: 'Masukkan lingkar kepala (cm)',
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          onChanged: null,
        ),
        InputDataApp(
          isRequired: true,
          controller: toddler.armController,
          title: 'Lingkar Lengan',
          hintText: 'Masukkan lingkar lengan (cm)',
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          onChanged: null,
        ),
        SelectDataApp(
          isRequired: true,
          title: 'Skrining TBC',
          options: ['Batuk Lama', 'BB Turun', 'Berkeringat Malam', 'Demam'],
          selectedValues: toddler.screeningTbc,
          onChanged: (value) => toddler.screeningTbc = value,
        ),
        SelectDataApp(
          isRequired: true,
          title: 'Balita Mendapatkan',
          options: [
            'Asi Eksklusif',
            'MP Asi',
            'Imunisasi Lengkap',
            'Vitamin A',
            'Obat Cacing',
            'PMT Lokal',
          ],
          selectedValues: toddler.obtain,
          onChanged: (value) => toddler.obtain = value,
        ),
        SelectDataApp(
          isRequired: true,
          title: 'Edukasi',
          options: ['Asi Eksklusif', 'MP Asi'],
          selectedValues: toddler.education,
          onChanged: (value) => toddler.education = value,
        ),
        ChoiceDataApp(
          isRequired: true,
          title: 'Ada Gejala Sakit',
          options: ['Ya', 'Tidak'],
          selectedValue: toddler.indicationIllness,
          onChanged: (value) => toddler.indicationIllness = value!,
        ),
        ChoiceDataApp(
          isRequired: true,
          title: 'Rujuk Puskesmas atau Pustu',
          options: ['Ya', 'Tidak'],
          selectedValue: toddler.healthCentre,
          onChanged: (value) => toddler.healthCentre = value!,
        ),
      ],
    );
  }
}
