import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidipo_apps/components/template/auth/auth_button.dart';
import 'package:sidipo_apps/components/template/auth/auth_form_.dart';
import 'package:sidipo_apps/components/template/auth/auth_hero.dart';
import 'package:sidipo_apps/components/template/auth/auth_option.dart';
import 'package:sidipo_apps/components/template/auth/auth_redirect.dart';
import 'package:sidipo_apps/components/template/auth/auth_text_field.dart';
import 'package:sidipo_apps/components/template/auth/auth_validate_form.dart';
import 'package:sidipo_apps/components/widget/divider_option_widget.dart';
import 'package:sidipo_apps/components/widget/scaffold_wigdet.dart';
import 'package:sidipo_apps/firebase_auth_status.dart';
import 'package:sidipo_apps/provider/firebase_auth_provider.dart';
import 'package:sidipo_apps/screens/routes/route_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ScaffoldWigdet(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 22),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                  AutofillGroup(
                    child: AuthForm(
                      formKey: _formKey,
                      fields: [
                        AuthTextField(
                          label: 'Nama lengkap Anda',
                          controller: _fullnameController,
                          keyboardType: TextInputType.name,
                          prefixIcon: Icons.person_outline,
                          validator: AuthValidate.validateFullName,
                        ),
                        AuthTextField(
                          label: 'Email',
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: Icons.email_outlined,
                          validator: AuthValidate.validateEmail,
                        ),
                        AuthTextField(
                          label: 'Password',
                          controller: _passwordController,
                          isPassword: true,
                          prefixIcon: Icons.lock_outline,
                          keyboardType: TextInputType.visiblePassword,
                          validator: AuthValidate.validatePassword,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Consumer<FirebaseAuthProvider>(
                    builder: (context, value, child) {
                      final isLoading =
                          value.authStatus ==
                          FirebaseAuthStatus.creatingAccount;
                      return AuthButton(
                        titleButton: 'Daftar',
                        onTapButton: _tapToRegister,
                        isLoading: isLoading,
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  DividerOptionWidget(label: 'Atau daftar dengan'),
                  const SizedBox(height: 24),
                  AuthOptionButton(),
                  const SizedBox(height: 24),
                  AuthRedirect(
                    pressKey: 'auth_redirect',
                    titleQuestion: 'Sudah memiliiki akun?',
                    titleAction: 'Masuk',
                    onTapRedirect: _goToLogin,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _tapToRegister() async {
    if (!_formKey.currentState!.validate()) return;
    final fullname = _fullnameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final firebaseAuthProvider = context.read<FirebaseAuthProvider>();
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    await firebaseAuthProvider.createAccount(fullname, email, password);
    if (firebaseAuthProvider.authStatus == FirebaseAuthStatus.accountCreated) {
      navigator.pop();
    } else {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(firebaseAuthProvider.message ?? "Terjadi kesalahan"),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _goToLogin() async {
    Navigator.pushReplacementNamed(context, RouteScreen.login.name);
  }

  @override
  void dispose() {
    _fullnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
