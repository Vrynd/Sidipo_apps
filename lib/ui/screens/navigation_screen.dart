// Flutter & Dart
import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/provider/bottom_navbar_provider.dart';
// Custom widgets / UI
import 'package:posyandu_digital_app/ui/custom/scaffold_custom.dart';
import 'package:posyandu_digital_app/ui/screens/main/home_screen.dart';

// Provider
import 'package:provider/provider.dart';
// Third-party
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  // Get Theme
  ColorScheme get color => Theme.of(context).colorScheme;
  TextTheme get textStyle => Theme.of(context).textTheme;

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarProvider>(
      builder: (context, nav, child) {
        return ScaffoldCustom(
          body: switch (nav.selectedIndex) {
            0 => const HomeScreen(),
            _ => const HomeScreen(),
          },
          bottomNavigationBar: Material(
            elevation: 1.1,
            color: color.shadow,
            child: SalomonBottomBar(
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
              backgroundColor: Theme.of(
                context,
              ).colorScheme.surfaceContainerLowest,
              currentIndex: nav.selectedIndex,
              onTap: (i) => nav.setSelectedIndex(i),
              items: [
                SalomonBottomBarItem(
                  icon: Icon(Icons.dashboard_outlined, size: 28),
                  title: Text(
                    "Dashboard",
                    style: textStyle.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  selectedColor: color.primary,
                  unselectedColor: color.secondary,
                ),
                SalomonBottomBarItem(
                  icon: Icon(Icons.monitor_heart_outlined, size: 28),
                  title: Text(
                    "Layanan",
                    style: textStyle.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  selectedColor: color.primary,
                  unselectedColor: color.secondary,
                ),
                SalomonBottomBarItem(
                  icon: Icon(Icons.history_outlined, size: 28),
                  title: Text(
                    "Warga",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  selectedColor: Theme.of(context).colorScheme.primary,
                  unselectedColor: Theme.of(context).colorScheme.secondary,
                ),
                SalomonBottomBarItem(
                  icon: Icon(Icons.account_circle_outlined, size: 28),
                  title: Text(
                    "Profile",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  selectedColor: Theme.of(context).colorScheme.primary,
                  unselectedColor: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
