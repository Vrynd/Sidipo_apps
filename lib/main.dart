import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sidipo_apps/firebase_options.dart';
import 'package:sidipo_apps/provider/button_press_provider.dart';
import 'package:sidipo_apps/provider/firebase_auth_provider.dart';
import 'package:sidipo_apps/provider/redirect_press_provider.dart';
import 'package:sidipo_apps/provider/shared_preferences_provider.dart';
import 'package:sidipo_apps/provider/show_password_provider.dart';
import 'package:sidipo_apps/screens/auth/forgot_password_screen.dart';
import 'package:sidipo_apps/screens/auth/login_screen.dart';
import 'package:sidipo_apps/screens/auth/register_screen.dart';
import 'package:sidipo_apps/screens/main/home_screen.dart';
import 'package:sidipo_apps/screens/main/profille_screen.dart';
import 'package:sidipo_apps/screens/routes/route_screen.dart';
import 'package:sidipo_apps/service/firebase_auth_service.dart';
import 'package:sidipo_apps/service/shared_preference_service.dart';
import 'package:sidipo_apps/themes/theme_apps.dart';

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
        Provider(create: (context) => SharedPreferencesService(pref)),
        ChangeNotifierProvider(
          create: (context) => SharedPreferenceProvider(
            context.read<SharedPreferencesService>(),
          ),
        ),
        ChangeNotifierProvider(create: (context) => RedirectPressProvider()),
        ChangeNotifierProvider(create: (context) => ButtonPressProvider()),
        ChangeNotifierProvider(create: (context) => ShowHidePasswordProvider()),
      ],
      child: const MyApp(),
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
        RouteScreen.home.name: (context) => const HomeScreen(),
        RouteScreen.profile.name: (context) => const ProfileScreen(),
      },
    );
  }
}
