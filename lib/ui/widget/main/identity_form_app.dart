import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/models/village_identity.dart';
import 'package:posyandu_digital_app/ui/widget/main/choice_data_app.dart';
import 'package:posyandu_digital_app/ui/widget/main/input_data_app.dart';


class IdentityFormApp extends StatelessWidget {
  final VillageIdentity identity;
  final void Function(void Function()) setState;

  const IdentityFormApp({
    super.key,
    required this.identity,
    required this.setState,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputDataApp(
          isRequired: true,
          controller: identity.nameController,
          title: 'Nama Lengkap',
          hintText: 'Masukkan nama lengkap sesuai KTP',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          onChanged: (value) => debugPrint("Nama Lengkap: $value"),
        ),
        InputDataApp(
          isRequired: true,
          controller: identity.nikController,
          title: 'Nomor Induk Kependudukan',
          hintText: 'Masukkan 16 digit angka',
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.number,
          onChanged: (value) => debugPrint("Nomor Induk Kependudukan: $value"),
        ),
        ChoiceDataApp(
          isRequired: true,
          title: 'Kepesertaan BPJS',
          options: ['Ya', 'Tidak'],
          selectedValue: identity.selectedBpjs,
          onChanged: (value) => setState(() => identity.selectedBpjs = value),
        ),
        InputDataApp(
          isRequired: true,
          controller: identity.nomorBpjsController,
          title: 'Nomor BPJS Kesehatan',
          hintText: 'Masukkan 13 digit angka',
          keyboardType: TextInputType.number,
          onChanged: (value) => debugPrint("Nomor BPJS: $value"),
        ),
        InputDataApp(
          isRequired: true,
          controller: identity.birthDateController,
          title: 'Tanggal Lahir',
          hintText: 'Masukkan tanggal lahir anda',
          onChanged: (value) => debugPrint("Tanggal Lahir: $value"),
        ),
        ChoiceDataApp(
          isRequired: true,
          title: 'Jenis Kelamin',
          options: ['Laki-laki', 'Perempuan'],
          selectedValue: identity.selectedGender,
          onChanged: (value) => setState(() => identity.selectedGender = value),
        ),
        InputDataApp(
          isRequired: true,
          controller: identity.addressController,
          title: 'Alamat',
          hintText: 'Masukkan alamat sesuai KTP',
          keyboardType: TextInputType.streetAddress,
          minLines: 1,
          maxLines: 3,
          onChanged: (value) => debugPrint("Alamat: $value"),
        ),
        InputDataApp(
          isRequired: true,
          controller: identity.rtController,
          title: 'Tingkat Rt',
          hintText: 'Masukkan sesuai rt masing masing',
          keyboardType: TextInputType.number,
          onChanged: (value) => debugPrint("Rt: $value"),
        ),
        InputDataApp(
          isRequired: true,
          controller: identity.rwController,
          title: 'Tingkat Rw',
          hintText: 'Masukkan sesuai rw masing masing',
          keyboardType: TextInputType.number,
          onChanged: (value) => debugPrint("Rw: $value"),
        ),
        ChoiceDataApp(
          isRequired: true,
          title: 'Status Pernikahan',
          options: [
            'Menikah',
            'Tidak Menikah',
            'Cerai Mati',
            'Cerai Hidup',
            'Belum Menikah',
          ],
          selectedValue: identity.selectedStatus,
          onChanged: (value) => setState(() => identity.selectedStatus = value),
        ),
        ChoiceDataApp(
          isRequired: true,
          title: 'Status Pekerjaan',
          options: [
            'Petani',
            'Buruh Tani',
            'PNS',
            'Wiraswata',
            'Karyawan Swasta',
            'Ibu Rumah Tangga',
            'Nelayan',
            'Belum Bekerja',
          ],
          selectedValue: identity.selectedWork,
          onChanged: (value) => setState(() => identity.selectedWork = value),
        ),
        InputDataApp(
          isRequired: true,
          controller: identity.noHpController,
          title: 'No Handphone (berikan tanda - jika tidak ada)',
          hintText: 'Masukkan 12 digit angka',
          keyboardType: TextInputType.number,
          onChanged: (value) => debugPrint("No HP: $value"),
        ),
      ],
    );
  }
}
