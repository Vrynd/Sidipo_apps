import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidipo_apps/components/template/auth/auth_button.dart';
import 'package:sidipo_apps/components/template/auth/auth_form_.dart';
import 'package:sidipo_apps/components/template/auth/auth_hero.dart';
import 'package:sidipo_apps/components/template/auth/auth_redirect.dart';
import 'package:sidipo_apps/components/template/auth/auth_text_field.dart';
import 'package:sidipo_apps/components/widget/scaffold_wigdet.dart';
import 'package:sidipo_apps/firebase_auth_status.dart';
import 'package:sidipo_apps/provider/firebase_auth_provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWigdet(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 22),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 66,
                    minHeight: 66,
                    maxWidth: 74,
                    maxHeight: 74,
                  ),
                  child: Image.asset('assets/images/wellness.png'),
                ),
                const SizedBox(height: 24),
                const AuthHero(
                  title: 'Lupa Password?',
                  subtitle: 'Masukkan email Anda untuk reset password',
                ),
                const SizedBox(height: 24),
                AuthForm(
                  fields: [
                    AuthTextField(
                      label: 'Email',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.email_outlined,
                      autofillHints: const [AutofillHints.email],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Consumer<FirebaseAuthProvider>(
                  builder: (context, value, child) {
                    final isLoading =
                        value.authStatus ==
                        FirebaseAuthStatus.resettingPassword;
                    return AuthButton(
                      titleButton: 'Reset Password',
                      onTapButton: _tapToReset,
                      isLoading: isLoading,
                    );
                  },
                ),
                const SizedBox(height: 24),
                AuthRedirect(
                  titleQuestion: 'Ingat password Anda?',
                  titleAction: 'Masuk',
                  pressKey: 'auth_redirect',
                  onTapRedirect: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
                "Cek email Anda untuk reset password",
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

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
