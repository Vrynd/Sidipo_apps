import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/provider/checkup/resident_provider.dart';
import 'package:posyandu_digital_app/ui/widget/main/choice_data_app.dart';
import 'package:posyandu_digital_app/ui/widget/main/input_data_app.dart';
import 'package:provider/provider.dart';

class ResidentFormApp extends StatelessWidget {
  const ResidentFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ResidentProvider>(
      builder: (context, provider, child) {
        final identity = provider.resident;

        return Column(
          children: [
            InputDataApp(
              isRequired: true,
              controller: identity.nameController,
              title: 'Nama Lengkap',
              hintText: 'Masukkan nama lengkap sesuai KTP',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              onChanged: (_) => provider.onFieldChanged(),
            ),
            InputDataApp(
              isRequired: true,
              controller: identity.nikController,
              title: 'Nomor Induk Kependudukan',
              hintText: 'Masukkan 16 digit angka',
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              onChanged:(_) => provider.onFieldChanged(),
            ),
            ChoiceDataApp(
              isRequired: true,
              title: 'Kepesertaan BPJS',
              options: ['Ya', 'Tidak'],
              selectedValue: identity.selectedBpjs,
              onChanged: (value) => provider.setBpjs(value!)
            ),
            InputDataApp(
              isRequired: true,
              controller: identity.nomorBpjsController,
              title: 'Nomor BPJS Kesehatan',
              hintText: 'Masukkan 13 digit angka',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onChanged:(_) => provider.onFieldChanged(),
            ),
            InputDataApp(
              isRequired: true,
              controller: identity.birthDateController,
              title: 'Tanggal Lahir',
              hintText: 'Masukkan tanggal lahir anda',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.datetime,
              onChanged: (_) => provider.onFieldChanged(),
            ),
            ChoiceDataApp(
              isRequired: true,
              title: 'Jenis Kelamin',
              options: ['Laki-laki', 'Perempuan'],
              selectedValue: identity.selectedGender,
              onChanged:(value) => provider.setGender(value!)
            ),
            InputDataApp(
              isRequired: true,
              controller: identity.addressController,
              title: 'Alamat',
              hintText: 'Masukkan alamat sesuai KTP',
              keyboardType: TextInputType.streetAddress,
              textInputAction: TextInputAction.next,
              minLines: 1,
              maxLines: 3,
              onChanged:(_) => provider.onFieldChanged(),
            ),
            InputDataApp(
              isRequired: true,
              controller: identity.rtController,
              title: 'Tingkat Rt',
              hintText: 'Masukkan sesuai rt masing masing',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onChanged: (_) => provider.onFieldChanged(),
            ),
            InputDataApp(
              isRequired: true,
              controller: identity.rwController,
              title: 'Tingkat Rw',
              hintText: 'Masukkan sesuai rw masing masing',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              onChanged:(_) => provider.onFieldChanged(),
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
              onChanged: (value) => provider.setStatus(value!)
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
              onChanged: (value) => provider.setWork(value!)
            ),
            InputDataApp(
              isRequired: true,
              controller: identity.noHpController,
              title: 'No Handphone (berikan tanda - jika tidak ada)',
              hintText: 'Masukkan 12 digit angka',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              onChanged: (_) => provider.onFieldChanged(),
            ),
          ],
        );
      },
    );
  }
}
