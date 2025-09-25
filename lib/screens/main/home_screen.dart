import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidipo_apps/components/widget/scaffold_wigdet.dart';
import 'package:sidipo_apps/firebase_auth_status.dart';
import 'package:sidipo_apps/provider/firebase_auth_provider.dart';
import 'package:sidipo_apps/provider/shared_preferences_provider.dart';
import 'package:sidipo_apps/screens/routes/route_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _cachedUsername;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final profile = context.read<FirebaseAuthProvider>().profile;
    if (profile != null && profile.fullname != null) {
      _cachedUsername = profile.fullname!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWigdet(
      isFullScreen: true,
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat Datang, ${_getUsername()}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Consumer<FirebaseAuthProvider>(
              builder: (context, provider, child) {
                final isLoading =
                    provider.authStatus == FirebaseAuthStatus.signingOut;

                return ElevatedButton.icon(
                  onPressed: isLoading ? null : _tapToSignOut,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                  ),
                  icon: isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.logout),
                  label: Text(
                    isLoading ? "Logging out..." : "Logout",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  String _getUsername() {
    final fullname = _cachedUsername ?? "Pengguna";
    final parts = fullname.split(" ");
    if (parts.length == 1) {
      return parts.first;
    } else if (parts.length > 1) {
      return "${parts[0]} ${parts[1]}";
    }
    return "Pengguna";
  }

  void _tapToSignOut() async {
    final sharedPreferenceProvider = context.read<SharedPreferenceProvider>();
    final firebaseAuthProvider = context.read<FirebaseAuthProvider>();
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    await firebaseAuthProvider
        .signOutUser()
        .then((value) async {
          await sharedPreferenceProvider.logout();
          navigator.pushReplacementNamed(RouteScreen.login.name);
        })
        .whenComplete(() {
          scaffoldMessenger.showSnackBar(
            SnackBar(
              content: Text(firebaseAuthProvider.message ?? ""),
              behavior: SnackBarBehavior.floating,
            ),
          );
        });
  }
}
