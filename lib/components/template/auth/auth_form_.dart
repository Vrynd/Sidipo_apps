import 'package:flutter/material.dart';
import 'package:sidipo_apps/components/template/auth/auth_text_field.dart';

class AuthForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const AuthForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AuthTextField(
            controller: emailController,
            label: 'Email atau Username',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 22),
          AuthTextField(
            controller: passwordController,
            label: 'Password',
            obscureText: true,
            suffixIcon: Icon(
              Icons.visibility_off_outlined,
              size: 24,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
            keyboardType: TextInputType.visiblePassword,
          ),
        ],
      ),
    );
  }
}
