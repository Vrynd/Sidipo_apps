import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/ui/custom/app_bar_custom.dart';
import 'package:posyandu_digital_app/ui/custom/bottom_bar_custom.dart';
import 'package:posyandu_digital_app/ui/custom/scaffold_custom.dart';
import 'package:posyandu_digital_app/ui/widget/auth/auth_button.dart';
import 'package:posyandu_digital_app/ui/widget/auth/auth_textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBarCustom(
        title: 'Ups, Lupa Password ya?',
        subtitle: 'Pulihkan akunmu sekarang',
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
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
                  AuthButton(textAction: 'Reset Password', onPressed: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomBarCustom(
        text: 'Sudah ingat password ?',
        actionText: 'Masuk sekarang',
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
