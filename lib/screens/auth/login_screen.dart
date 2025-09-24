import 'package:flutter/material.dart';
import 'package:sidipo_apps/components/template/auth/auth_button.dart';
import 'package:sidipo_apps/components/template/auth/auth_form_.dart';
import 'package:sidipo_apps/components/template/auth/auth_hero.dart';
import 'package:sidipo_apps/components/template/auth/auth_option.dart';
import 'package:sidipo_apps/components/template/auth/auth_redirect.dart';
import 'package:sidipo_apps/components/template/auth/auth_text_field.dart';
import 'package:sidipo_apps/components/widget/divider_option_widget.dart';
import 'package:sidipo_apps/components/widget/forgot_password_widget.dart';
import 'package:sidipo_apps/components/widget/scaffold_wigdet.dart';
import 'package:sidipo_apps/screens/routes/route_screen.dart';

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
                const SizedBox(height: 24),
                AuthForm(
                  fields: [
                    AuthTextField(
                      label: 'Email atau Username',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.email_outlined,
                      validator: (value) => value!.isEmpty
                          ? 'Email atau username Tidak boleh kosong'
                          : null,
                    ),
                    AuthTextField(
                      label: 'Password',
                      controller: _passwordController,
                      prefixIcon: Icons.lock_outline_rounded,
                      isPassword: true,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) =>
                          value!.isEmpty ? 'Password Tidak boleh kosong' : null,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ForgotPasswordWidget(
                  pressKey: 'forgot_password',
                  onTapLink: _goToForgotPassword,
                ),
                const SizedBox(height: 24),
                AuthButton(titleButton: 'Masuk', onTapButton: () {}),
                const SizedBox(height: 24),
                DividerOptionWidget(label: 'Atau masuk dengan'),
                const SizedBox(height: 24),
                AuthOptionButton(),
                const SizedBox(height: 24),
                AuthRedirect(
                  titleQuestion: 'Belum punya akun?',
                  titleAction: 'Daftar Disini',
                  pressKey: 'auth_redirec',
                  onTapRedirect: _goToRegister,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _goToRegister() async {
    Navigator.pushNamed(context, RouteScreen.register.name);
  }

  void _goToForgotPassword() async {
    Navigator.pushNamed(context, RouteScreen.forgotPassword.name);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
