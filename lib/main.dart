// Flutter & Firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// Firebase config
import 'package:posyandu_digital_app/firebase_options.dart';
// Provider
import 'package:posyandu_digital_app/provider/bottom_navbar_provider.dart';
import 'package:posyandu_digital_app/provider/firebase_auth_provider.dart';
import 'package:posyandu_digital_app/provider/shared_preference_provider.dart';
import 'package:posyandu_digital_app/provider/show_password_provider.dart';
// Routes
import 'package:posyandu_digital_app/utils/routes/navigation.dart';
// Service
import 'package:posyandu_digital_app/service/firebase_auth_service.dart';
import 'package:posyandu_digital_app/service/shared_preference_service.dart';
import 'package:posyandu_digital_app/utils/themes/theme.apps.dart';
// UI & Screen
import 'package:posyandu_digital_app/ui/screens/auth/forgot_password_screen.dart';
import 'package:posyandu_digital_app/ui/screens/auth/login_screen.dart';
import 'package:posyandu_digital_app/ui/screens/auth/register_screen.dart';
import 'package:posyandu_digital_app/ui/screens/navigation_screen.dart';
// Provider & Shared Preferences
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final firebaseAuth = FirebaseAuth.instance;
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => FirebaseAuthService(firebaseAuth)),
        ChangeNotifierProvider(
          create: (context) =>
              FirebaseAuthProvider(context.read<FirebaseAuthService>()),
        ),
        Provider(create: (context) => SharedPreferenceService(pref)),
        ChangeNotifierProvider(
          create: (context) =>
              SharedPreferenceProvider(context.read<SharedPreferenceService>()),
        ),
        ChangeNotifierProvider(create: (context) => ShowPasswordProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
      ],
      child: MyApp(),
    ),
  );
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
        RouteScreen.forgotPassword.name: (context) =>
            const ForgotPasswordScreen(),
        RouteScreen.home.name: (context) => const NavigationScreen(),
      },
    );
  }
}
