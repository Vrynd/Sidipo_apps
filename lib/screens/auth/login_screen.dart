import 'package:flutter/material.dart';
import 'package:sidipo_apps/components/template/auth/auth_button.dart';
import 'package:sidipo_apps/components/template/auth/auth_form_.dart';
import 'package:sidipo_apps/components/template/auth/auth_hero.dart';
import 'package:sidipo_apps/components/template/auth/auth_option.dart';
import 'package:sidipo_apps/components/template/auth/auth_redirect.dart';
import 'package:sidipo_apps/components/widget/divider_option_widget.dart';
import 'package:sidipo_apps/components/widget/forgot_password_widget.dart';
import 'package:sidipo_apps/components/widget/scaffold_wigdet.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
              mainAxisAlignment: MainAxisAlignment.center,
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
                AuthHero(
                  title: 'Masuk Ke Akun Anda',
                  subtitle: 'Silakan masukkan data akun Anda',
                ),
                const SizedBox(height: 32),
                AuthForm(
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                const SizedBox(height: 24),
                ForgotPasswordWidget(onTapLink: _goToForgotPassword),
                const SizedBox(height: 24),
                AuthButton(titleButton: 'Masuk', onTapButton: _goToRegister),
                const SizedBox(height: 24),
                DividerOptionWidget(),
                const SizedBox(height: 24),
                AuthOptionButton(),
                const SizedBox(height: 24),
                AuthRedirect(
                  titleQuestion: 'Belum punya akun?',
                  titleAction: 'Daftar',
                  onTapRedirect: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _goToRegister() async {}

  void _goToForgotPassword() async {}

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
