import 'package:flutter/material.dart';
import 'package:sidipo_apps/screens/auth/forgot_password_screen.dart';
import 'package:sidipo_apps/screens/auth/login_screen.dart';
import 'package:sidipo_apps/screens/auth/register_screen.dart';
import 'package:sidipo_apps/screens/main/home_screen.dart';
import 'package:sidipo_apps/screens/main/profille_screen.dart';
import 'package:sidipo_apps/screens/routes/route_screen.dart';
import 'package:sidipo_apps/themes/theme_apps.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sidipo Apps',
      theme: ThemeApps.lightTheme,
      darkTheme: ThemeApps.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: RouteScreen.login.name,
      routes: {
        RouteScreen.login.name: (context) => const LoginScreen(),
        RouteScreen.register.name: (context) => const RegisterScreen(),
        RouteScreen.forgotPassword.name: (context) => const ForgotPasswordScreen(),
        RouteScreen.home.name: (context) => const HomeScreen(),
        RouteScreen.profile.name: (context) => const ProfileScreen(),
      },
    );
  }
}
