import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/firebase_auth_status.dart';
import 'package:posyandu_digital_app/provider/firebase_auth_provider.dart';
import 'package:posyandu_digital_app/routes/navigation.dart';
import 'package:posyandu_digital_app/ui/custom/app_bar_custom.dart';
import 'package:posyandu_digital_app/ui/custom/bottom_bar_custom.dart';
import 'package:posyandu_digital_app/ui/custom/scaffold_custom.dart';
import 'package:posyandu_digital_app/ui/widget/auth/auth_button.dart';
import 'package:posyandu_digital_app/ui/widget/auth/auth_divider.dart';
import 'package:posyandu_digital_app/ui/widget/auth/auth_option.dart';
import 'package:posyandu_digital_app/ui/widget/auth/auth_password.dart';
import 'package:posyandu_digital_app/ui/widget/auth/auth_textfield.dart';
import 'package:provider/provider.dart';

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
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ScaffoldCustom(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBarCustom(
          title: 'Senang Melihatmu Lagi!',
          subtitle: 'Kesehatanmu, prioritas kami',
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const BouncingScrollPhysics(),
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
                      textInputAction: TextInputAction.next,
                      autofillHints: const [AutofillHints.email],
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(height: 24),
                  AutofillGroup(
                    child: AuthPassword(
                      label: 'Password',
                      hintText: 'Masukkan password',
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      autofillHints: const [AutofillHints.password],
                      onChanged: (value) {},
                      onForgotPassword: _goToResetPassword,
                    ),
                  ),
                  SizedBox(height: 32),
                  Consumer<FirebaseAuthProvider>(
                    builder: (context, value, child) {
                      final isLoading =
                          value.authStatus == FirebaseAuthStatus.authenticating;
                      return AuthButton(
                        textAction: 'Masuk Ke Akun',
                        isLoading: isLoading,
                        onPressed: () {},
                      );
                    },
                  ),
                  SizedBox(height: 24),
                  AuthDivider(labelDivider: 'atau masuk dengan'),
                  const SizedBox(height: 24),
                  AuthOption(
                    options: [
                      ChoiceOption(
                        iconPath: 'assets/image/search.png',
                        onPressed: () {},
                      ),
                      ChoiceOption(
                        iconPath: 'assets/image/facebook.png',
                        onPressed: () {},
                      ),
                      ChoiceOption(
                        iconPath: 'assets/image/apple-logo.png',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomBarCustom(
          text: 'Belum punya akun?',
          actionText: 'Daftar Sekarang',
          onTap: _goToRegister,
        ),
      ),
    );
  }

  void _goToRegister() async {
    Navigator.pushNamed(context, RouteScreen.register.name);
  }

  void _goToResetPassword() async {
    Navigator.pushNamed(context, RouteScreen.forgotPassword.name);
  }

}
