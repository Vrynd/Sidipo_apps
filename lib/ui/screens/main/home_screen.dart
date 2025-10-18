// Flutter & Dart
import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/provider/firebase_auth_provider.dart';
import 'package:posyandu_digital_app/routes/navigation.dart';
// Custom widgets / UI
import 'package:posyandu_digital_app/ui/custom/scaffold_custom.dart';
import 'package:posyandu_digital_app/ui/widget/main/banner_app.dart';
import 'package:posyandu_digital_app/ui/widget/main/header_app.dart';
import 'package:posyandu_digital_app/ui/widget/main/health_service_app.dart';
import 'package:posyandu_digital_app/ui/widget/main/info_service_app.dart';
// Provider
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolling = false;
  String? _cachedUsername;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.offset > 10 && !_isScrolling) {
        setState(() => _isScrolling = true);
      } else if (_scrollController.offset <= 10 && _isScrolling) {
        setState(() => _isScrolling = false);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final profile = context.read<FirebaseAuthProvider>().profile;
    if (profile != null && profile.fullname != null) {
      _cachedUsername = profile.fullname!;
    }
  }

  String _getUsername() {
    final fullname = _cachedUsername ?? "User";
    final parts = fullname.split(" ");
    if (parts.length == 1) {
      return parts.first;
    } else if (parts.length > 1) {
      return "${parts[0]} ${parts[1]}";
    }
    return "User";
  }

  Future<void> _goToService(String serviceName) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3),
        );
      },
    );

    await Future.delayed(const Duration(seconds: 1));
    if (context.mounted) Navigator.pop(context);
    if (context.mounted) {
      Navigator.pushNamed(
        context,
        RouteScreen.service.name,
        arguments: serviceName,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: _isScrolling
            ? Theme.of(context).colorScheme.surfaceContainerLowest
            : Theme.of(context).colorScheme.surface,
        title: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: _isScrolling ? 1.0 : 0.0,
          child: Text(
            'Sidipo Apps'.toUpperCase(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(
          overscroll: false,
          physics: BouncingScrollPhysics(),
        ),
        child: ListView(
          controller: _scrollController,
          padding: EdgeInsets.only(top: 0, left: 22, right: 22, bottom: 22),
          children: [
            HeaderApp(username: _getUsername(), onAvatarTap: () {}),
            const SizedBox(height: 10),

            BannerApp(imagePath: 'assets/image/banner_posyandu.jpg'),
            const SizedBox(height: 30),

            Text(
              'Jadwal & Lokasi',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 14),
            InfoServiceApp(
              info: [
                InfoItem(
                  icon: Icons.place_outlined,
                  iconColor: Colors.redAccent,
                  title: 'Lokasi',
                  value: 'Balai Desa / Pustu',
                ),
                InfoItem(
                  icon: Icons.access_time_outlined,
                  iconColor: Colors.blueAccent,
                  title: 'Waktu Pelayanan',
                  value: '08.00 - 16.00 WIB',
                ),
              ],
              summary: [
                SummaryItem(
                  title: 'Durasi Pelayanan',
                  number: '2',
                  unit: 'hari',
                ),
                SummaryItem(
                  title: 'Kader yang Bertugas',
                  number: '10',
                  unit: 'kader',
                ),
              ],
            ),
            const SizedBox(height: 30),

            Text(
              'Layanan Kesehatan',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 14),
            HealthServiceApp(
              items: [
                ServiceItem(
                  icon: Icons.pregnant_woman_outlined,
                  title: 'Ibu Hamil dan Nifas',
                  subtitle: 'Pemeriksaan kehamilan & edukasi gizi',
                  iconColor: Colors.pink.shade700,
                  backgroundColor: Colors.pink.shade100,
                  onTapService: () => _goToService('Ibu Hamil dan Nifas'),
                ),
                ServiceItem(
                  icon: Icons.child_care_outlined,
                  title: 'Bayi atau Balita',
                  subtitle: 'Penimbangan & imunisasi',
                  iconColor: Colors.orange.shade700,
                  backgroundColor: Colors.yellow.shade100,
                  onTapService: () => _goToService('Bayi atau Balita'),
                ),
                ServiceItem(
                  icon: Icons.school_outlined,
                  title: 'Sekolah atau Remaja',
                  subtitle: 'Penyuluhan kesehatan reproduksi',
                  iconColor: Colors.blue.shade700,
                  backgroundColor: Colors.blue.shade100,
                  onTapService: () => _goToService('Sekolah atau Remaja'),
                ),
                ServiceItem(
                  icon: Icons.work_outline,
                  title: 'Dewasa',
                  subtitle: 'Cek tekanan & kolesterol',
                  iconColor: Colors.green.shade700,
                  backgroundColor: Colors.green.shade100,
                  onTapService: () => _goToService('Dewasa'),
                ),
                ServiceItem(
                  icon: Icons.elderly,
                  title: 'Lansia',
                  subtitle: 'Pemeriksaan rutin & senam',
                  iconColor: Colors.purple.shade700,
                  backgroundColor: Colors.purple.shade100,
                  onTapService: () => _goToService('Lansia'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
