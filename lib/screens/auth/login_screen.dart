import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidipo_apps/components/template/auth/auth_button.dart';
import 'package:sidipo_apps/components/template/auth/auth_form_.dart';
import 'package:sidipo_apps/components/template/auth/auth_hero.dart';
import 'package:sidipo_apps/components/template/auth/auth_option.dart';
import 'package:sidipo_apps/components/template/auth/auth_redirect.dart';
import 'package:sidipo_apps/components/template/auth/auth_text_field.dart';

import 'package:sidipo_apps/components/widget/divider_option_widget.dart';
import 'package:sidipo_apps/components/widget/forgot_password_widget.dart';
import 'package:sidipo_apps/components/widget/scaffold_wigdet.dart';
import 'package:sidipo_apps/firebase_auth_status.dart';
import 'package:sidipo_apps/provider/firebase_auth_provider.dart';
import 'package:sidipo_apps/provider/shared_preferences_provider.dart';
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
                    title: 'Masuk Ke Akun Anda',
                    subtitle: 'Silakan masukkan data akun Anda',
                  ),
                  const SizedBox(height: 24),
                  AutofillGroup(
                    child: AuthForm(
                      fields: [
                        AuthTextField(
                          label: 'Email',
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: Icons.email_outlined,
                          autofillHints: const [AutofillHints.email],
                        ),
                        AuthTextField(
                          label: 'Password',
                          controller: _passwordController,
                          isPassword: true,
                          prefixIcon: Icons.lock_outline,
                          keyboardType: TextInputType.visiblePassword,
                          autofillHints: const [AutofillHints.password],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  ForgotPasswordWidget(
                    pressKey: 'forgot_password',
                    onTapLink: _goToForgotPassword,
                  ),
                  const SizedBox(height: 24),
                  Consumer<FirebaseAuthProvider>(
                    builder: (context, value, child) {
                      final isLoading =
                          value.authStatus == FirebaseAuthStatus.authenticating;
                      return AuthButton(
                        titleButton: 'Masuk',
                        onTapButton: _tapToLogin,
                        isLoading: isLoading,
                      );
                    },
                  ),
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
      ),
    );
  }

  void _tapToLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      final sharedPreferenceProvider = context.read<SharedPreferenceProvider>();
      final firebaseAuthProvider = context.read<FirebaseAuthProvider>();
      final navigator = Navigator.of(context);
      final scaffoldMessenger = ScaffoldMessenger.of(context);

      await firebaseAuthProvider.signInUser(email, password);
      if (firebaseAuthProvider.authStatus == FirebaseAuthStatus.authenticated) {
        await sharedPreferenceProvider.login();
        navigator.pushReplacementNamed(RouteScreen.home.name);
      } else {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text(firebaseAuthProvider.message ?? "Terjadi Kesalahan"),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } else {
      const message = "Masukkan email dan password dengan benar";
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(message, style: Theme.of(context).textTheme.bodyLarge),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
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
