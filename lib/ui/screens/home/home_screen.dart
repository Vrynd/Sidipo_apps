import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/firebase_auth_status.dart';
import 'package:posyandu_digital_app/provider/firebase_auth_provider.dart';
import 'package:posyandu_digital_app/provider/shared_preference_provider.dart';
import 'package:posyandu_digital_app/routes/navigation.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _contentController = TextEditingController();
  final _padding = const EdgeInsets.symmetric(vertical: 4, horizontal: 8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Room'),
        actions: [
          Consumer<FirebaseAuthProvider>(
            builder: (context, value, child) {
              return switch (value.authStatus) {
                FirebaseAuthStatus.signingOut => const Center(
                  child: CircularProgressIndicator(),
                ),
                _ => IconButton(
                  icon: const Icon(Icons.close),
                  tooltip: 'Logout',
                  onPressed: () => _tapToSignOut(context),
                ),
              };
            },
          ),
        ],
      ),
      body: Padding(
        padding: _padding,
        child: Column(
          children: [
            const Expanded(child: Placeholder()),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    controller: _contentController,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 4,
                    decoration: InputDecoration(
                      contentPadding: _padding,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                DecoratedBox(
                  decoration: ShapeDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: const CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send),
                    color: Theme.of(context).colorScheme.onPrimary,
                    onPressed: () => _sendMessage(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _tapToSignOut(BuildContext context) async {
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

  void _sendMessage() async {}
}
