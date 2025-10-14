import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/provider/bottom_navbar_provider.dart';
import 'package:posyandu_digital_app/ui/custom/scaffold_custom.dart';
import 'package:posyandu_digital_app/ui/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarProvider>(
      builder: (context, nav, child) {
        return ScaffoldCustom(
          body: switch (nav.selectedIndex) {
            0 => const HomeScreen(),

            _ => const HomeScreen(),
          },
          bottomNavigationBar: SalomonBottomBar(
            margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
            backgroundColor: Theme.of(
              context,
            ).colorScheme.surfaceContainerLowest,
            currentIndex: nav.selectedIndex,
            onTap: (i) => nav.setSelectedIndex(i),
            items: [
              SalomonBottomBarItem(
                icon: Icon(Icons.explore_outlined, size: 28),
                title: Text(
                  "Beranda",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                selectedColor: Theme.of(context).colorScheme.primary,
                unselectedColor: Theme.of(context).colorScheme.secondary,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.health_and_safety_outlined, size: 28),
                title: Text(
                  "Pemeriksaan",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                selectedColor: Theme.of(context).colorScheme.primary,
                unselectedColor: Theme.of(context).colorScheme.secondary,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.history_outlined, size: 28),
                title: Text(
                  "Warga",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                selectedColor: Theme.of(context).colorScheme.primary,
                unselectedColor: Theme.of(context).colorScheme.secondary,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.account_circle_outlined, size: 28),
                title: Text(
                  "Profile",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                selectedColor: Theme.of(context).colorScheme.primary,
                unselectedColor: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
        );
      },
    );
  }
}
