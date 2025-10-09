import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/themes/theme.apps.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Skrining Apps',
      theme: ThemeApps.lightTheme,
      darkTheme: ThemeApps.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
