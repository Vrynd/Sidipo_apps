import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/provider/firebase_auth_provider.dart';
import 'package:posyandu_digital_app/provider/shared_preference_provider.dart';
import 'package:posyandu_digital_app/ui/widget/main/bottom_sheet.dart';
import 'package:posyandu_digital_app/ui/widget/main/health_service_grid.dart';
import 'package:posyandu_digital_app/ui/widget/main/recap_participant.dart';
import 'package:posyandu_digital_app/ui/widget/main/service_item.dart';
import 'package:posyandu_digital_app/ui/widget/main/title_action.dart';
import 'package:posyandu_digital_app/ui/widget/main/user_greeting.dart';
import 'package:posyandu_digital_app/utils/routes/navigation.dart';
import 'package:posyandu_digital_app/ui/custom/scaffold_custom.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // State
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> isScrollingNotifier = ValueNotifier(false);
  String? _cachedUsername;

  // Get Theme
  ColorScheme get color => Theme.of(context).colorScheme;
  TextTheme get textStyle => Theme.of(context).textTheme;

  // Format Username
  String _getUsername() {
    final fullname = _cachedUsername ?? "User";
    final parts = fullname.split(" ");
    if (parts.length == 1) return parts.first;
    if (parts.length > 1) return "${parts[0]} ${parts[1]}";
    return "User";
  }

  // Lifecycle
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 10) {
        isScrollingNotifier.value = true;
      } else {
        isScrollingNotifier.value = false;
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final profile = context.read<FirebaseAuthProvider>().profile;
    if (profile != null && profile.fullname != null) {
      _cachedUsername = profile.fullname!;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    isScrollingNotifier.dispose();
    super.dispose();
  }

  // Function
  Future<void> _tapToSignOut(BuildContext context) async {
    final sharedPreferenceProvider = context.read<SharedPreferenceProvider>();
    final firebaseAuthProvider = context.read<FirebaseAuthProvider>();
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    await firebaseAuthProvider
        .signOutUser()
        .then((value) async {
          await sharedPreferenceProvider.logout();
          navigator.pushReplacementNamed(RouteScreen.login.name);
        })
        .whenComplete(() {
          scaffoldMessenger.showSnackBar(
            SnackBar(
              content: Text(firebaseAuthProvider.message ?? ""),
              behavior: SnackBarBehavior.floating,
            ),
          );
        });
  }

  Future<void> _showLogoutConfirmation() async {
    final result = await showConfirmationSheet(
      context: context,
      color: color,
      textStyle: textStyle,
      title: "Konfirmasi Logout",
      description: "Apakah Anda yakin ingin keluar dari aplikasi?",
      confirmTitle: "Logout",
      cancelTitle: "Batal",
      icon: Icons.power_settings_new_rounded,
      iconColor: color.error,
      iconBackground: color.errorContainer,
    );

    if (result == true && mounted) {
      _tapToSignOut(context);
    }
  }

  // Build UI
  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      backgroundColor: color.primary,
      body: Stack(
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: isScrollingNotifier,
            builder: (context, isScrolling, child) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  gradient: isScrolling
                      ? null
                      : LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.topLeft,
                          colors: [Color(0xFF1C6585), Color(0xFF62B6CB)],
                        ),
                ),
              );
            },
          ),
          NestedScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                ValueListenableBuilder<bool>(
                  valueListenable: isScrollingNotifier,
                  builder: (context, isScrolling, child) {
                    return SliverAppBar(
                      backgroundColor: isScrolling
                          ? color.surfaceContainerLowest
                          : Colors.transparent,
                      expandedHeight: 90,
                      pinned: true,
                      elevation: 0,
                      centerTitle: true,
                      scrolledUnderElevation: 0.8,
                      surfaceTintColor: color.surfaceContainerLowest,
                      shadowColor: color.shadow.withValues(alpha: 0.5),
                      title: AnimatedOpacity(
                        duration: const Duration(milliseconds: 250),
                        opacity: isScrolling ? 1 : 0,
                        child: Text(
                          "Sidipo Apps".toUpperCase(),
                          style: textStyle.titleMedium?.copyWith(
                            color: color.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          padding: const EdgeInsets.only(top: 40, bottom: 8),
                          alignment: Alignment.bottomLeft,
                          child: UserGreeting(
                            username: _getUsername(),
                            color: color,
                            textStyle: textStyle,
                            onAvatarTap: () {},
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ];
            },

            body: Container(
              decoration: BoxDecoration(
                color: color.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                children: [
                  TitleAction(
                    color: color,
                    textStyle: textStyle,
                    mainTitle: 'Dashboard',
                    onLogoutPressed: () => _showLogoutConfirmation(),
                  ),
                  const SizedBox(height: 14),
                  RecapParticipant(
                    color: color,
                    textStyle: textStyle,
                    itemsData: [
                      {
                        'title': 'Ibu Hamil & Nifas',
                        'percentage': 6,
                        'count': 350,
                        'newCount': -20,
                        'trend': 'down',

                      },
                      {
                        'title': 'Balita atau Bayi',
                        'percentage': 10,
                        'count': 550,
                        'newCount': 10,
                        'trend': 'up',

                      },
                      {
                        'title': 'Remaja atau Sekolah',
                        'percentage': 5,
                        'count': 200,
                        'trend': 'up',
                      },
                      {
                        'title': 'Dewasa',
                        'percentage': 0,
                        'count': 300,
                        'trend': 'flat',
                      },
                      {
                        'title': 'Lansia',
                        'percentage': 8,
                        'count': 870,
                        'trend': 'up',
                      },
                    ],
                  ),
                  const SizedBox(height: 30),

                  TitleAction(
                    color: color,
                    textStyle: textStyle,
                    mainTitle: 'Layanan Kesehatan',
                    showAction: false,
                  ),
                  const SizedBox(height: 14),
                  HealthServiceGrid(
                    color: color,
                    textStyle: textStyle,
                    items: ServiceItem.defaultItems(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
