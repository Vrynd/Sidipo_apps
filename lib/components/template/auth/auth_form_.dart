import 'package:flutter/material.dart';
import 'package:sidipo_apps/components/template/auth/auth_text_field.dart';

class AuthForm extends StatelessWidget {
  final List<AuthTextField> fields;
  final GlobalKey<FormState>? formKey;

  const AuthForm({
    super.key,
    required this.fields,
    this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < fields.length; i++) ...[
            fields[i],
            if (i != fields.length - 1) const SizedBox(height: 22),
          ]
        ],
      ),
    );
  }
}
