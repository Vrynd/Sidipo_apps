import 'package:flutter/material.dart';
import 'package:sidipo_apps/components/template/auth/auth_choice_option.dart';

class AuthOptionButton extends StatelessWidget {
  const AuthOptionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AuthChoiceOption(
          iconPath: 'assets/images/google.png',
          label: 'Google',
          onTapChoiceOption: () {},
        ),
        const SizedBox(width: 16),
        AuthChoiceOption(
          iconPath: 'assets/images/facebook.png',
          label: 'Facebook',
          onTapChoiceOption: () {},
        ),
      ],
    );
  }
}
