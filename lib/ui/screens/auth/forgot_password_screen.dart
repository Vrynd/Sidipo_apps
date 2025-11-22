import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/firebase_auth_status.dart';
import 'package:posyandu_digital_app/provider/firebase_auth_provider.dart';
import 'package:posyandu_digital_app/provider/shared_preference_provider.dart';
import 'package:posyandu_digital_app/utils/routes/navigation.dart';
import 'package:posyandu_digital_app/ui/custom/app_bar_custom.dart';
import 'package:posyandu_digital_app/ui/custom/bottom_bar_custom.dart';
import 'package:posyandu_digital_app/ui/custom/scaffold_custom.dart';
import 'package:posyandu_digital_app/ui/widget/auth/auth_button.dart';
import 'package:posyandu_digital_app/ui/widget/auth/auth_textfield.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ScaffoldCustom(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBarCustom(
          title: 'Ups, Lupa Password ya?',
          subtitle: 'Pulihkan akunmu sekarang',
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  AutofillGroup(
                    child: AuthTextField(
                      label: 'Email Address',
                      hintText: 'Masukkan email anda',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      autofillHints: const [AutofillHints.email],
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(height: 32),
                  Consumer<FirebaseAuthProvider>(
                    builder: (context, value, child) {
                      final isLoading =
                          value.authStatus ==
                          FirebaseAuthStatus.ressetingPassword;
                      return AuthButton(
                        textAction: "Reset Password",
                        onPressed: _tapToReset,
                        isLoading: isLoading,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomBarCustom(
          text: 'Sudah ingat password?',
          actionText: 'Masuk sekarang',
          onTap: _goToLogin
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final firebaseAuthProvider = context.read<FirebaseAuthProvider>();
    final navigator = Navigator.of(context);
    final isLogin = context.read<SharedPreferenceProvider>().isLogin;

    Future.microtask(() async {
      if (isLogin) {
        await firebaseAuthProvider.updateProfile();
        navigator.pushReplacementNamed(RouteScreen.home.name);
      }
    });
  }

  void _tapToReset() async {
    final email = _emailController.text.trim();

    final firebaseAuthProvider = context.read<FirebaseAuthProvider>();
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    if (email.isEmpty) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            "Masukkan email anda dengan benar",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
      return;
    }

    await firebaseAuthProvider.resetPassword(email);
    if (!mounted) return;
    if (firebaseAuthProvider.authStatus ==
        FirebaseAuthStatus.passwordResetEmailSent) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            firebaseAuthProvider.message ??
                "Cek email Anda untuk reset kata sandi",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );

      navigator.pop();
    } else if (firebaseAuthProvider.authStatus == FirebaseAuthStatus.error) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            firebaseAuthProvider.message ?? "Terjadi kesalahan",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    }
  }

  void _goToLogin() async {
    Navigator.pushNamed(context, RouteScreen.login.name);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
