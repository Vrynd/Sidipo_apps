import 'package:flutter/material.dart';
import 'package:sidipo_apps/components/template/auth/auth_button.dart';
import 'package:sidipo_apps/components/template/auth/auth_form_.dart';
import 'package:sidipo_apps/components/template/auth/auth_hero.dart';
import 'package:sidipo_apps/components/template/auth/auth_redirect.dart';
import 'package:sidipo_apps/components/template/auth/auth_text_field.dart';
import 'package:sidipo_apps/components/widget/scaffold_wigdet.dart';

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
                      validator: (value) =>
                          value!.isEmpty ? 'Email tidak boleh kosong' : null,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                AuthButton(titleButton: 'Reset Password', onTapButton: () {}),
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

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
