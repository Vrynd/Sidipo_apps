import 'package:flutter/material.dart';
import 'package:sidipo_apps/components/template/auth/auth_button.dart';
import 'package:sidipo_apps/components/template/auth/auth_form_.dart';
import 'package:sidipo_apps/components/template/auth/auth_hero.dart';
import 'package:sidipo_apps/components/template/auth/auth_option.dart';
import 'package:sidipo_apps/components/template/auth/auth_redirect.dart';
import 'package:sidipo_apps/components/template/auth/auth_text_field.dart';
import 'package:sidipo_apps/components/widget/divider_option_widget.dart';
import 'package:sidipo_apps/components/widget/scaffold_wigdet.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _fullnameController = TextEditingController();
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
                  title: 'Buat Akun Baru',
                  subtitle: 'Silakan masukkan data akun Anda',
                ),
                const SizedBox(height: 24),
                AuthForm(
                  fields: [
                    AuthTextField(
                      label: 'Nama lengkap Anda',
                      controller: _fullnameController,
                      keyboardType: TextInputType.name,
                      validator: (value) =>
                          value!.isEmpty ? 'Nama Tidak boleh kosong' : null,
                    ),
                    AuthTextField(
                      label: 'Email',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => value!.isEmpty
                          ? 'Email atau username Tidak boleh kosong'
                          : null,
                    ),
                    AuthTextField(
                      label: 'Password',
                      controller: _passwordController,
                      obscureText: true,
                      suffixIcon: Icon(
                        Icons.visibility_off_outlined,
                        size: 24,
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) =>
                          value!.isEmpty ? 'Password Tidak boleh kosong' : null,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                AuthButton(titleButton: 'Daftar Akun', onTapButton: () {}),
                const SizedBox(height: 24),
                DividerOptionWidget(label: 'Atau daftar dengan',),
                const SizedBox(height: 24),
                AuthOptionButton(),
                const SizedBox(height: 24),
                AuthRedirect(
                  titleQuestion: 'Sudah memiliiki akun?',
                  titleAction: 'Masuk',
                  onTapRedirect: _goToLogin,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _goToLogin() async {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _fullnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
