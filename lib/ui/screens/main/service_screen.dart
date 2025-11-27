import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/ui/widget/main/app_info.dart';
import 'package:posyandu_digital_app/ui/widget/main/header.dart';
import 'package:posyandu_digital_app/ui/custom/scaffold_custom.dart';
import 'package:posyandu_digital_app/ui/widget/main/health_service.dart';
import 'package:posyandu_digital_app/models/service_item.dart';
import 'package:posyandu_digital_app/ui/widget/main/title_section.dart';
import 'package:posyandu_digital_app/utils/routes/navigation.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  // State
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> isScrollingNotifier = ValueNotifier(false);

  // Get Theme
  ColorScheme get color => Theme.of(context).colorScheme;
  TextTheme get textStyle => Theme.of(context).textTheme;

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
  void dispose() {
    _scrollController.dispose();
    isScrollingNotifier.dispose();
    super.dispose();
  }

  List<ServiceItem> get services => ServiceItem.defaultItems.map((item) {
    return ServiceItem(
      title: item.title,
      icon: item.icon,
      iconColor: item.iconColor,
      backgroundColor: item.backgroundColor,
      onTap: () => _goToDetail(item),
    );
  }).toList();

  void _goToDetail(ServiceItem item) {
    Navigator.pushNamed(
      context,
      RouteScreen.timelineService.name,
      arguments: item,
    );
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
                      expandedHeight: 110,
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
                          "Layanan Kesehatan",
                          style: textStyle.titleMedium?.copyWith(
                            color: color.onSurface,
                            fontSize: 19.5,
                          ),
                        ),
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          padding: const EdgeInsets.only(top: 40, bottom: 15),
                          alignment: Alignment.bottomLeft,
                          child: Header(
                            mainTitle: 'Layanan Kesehatan',
                            subTitle: '5 Layanan Tersedia',
                            color: color,
                            textStyle: textStyle,
                            showActions: false,
                            useGreeting: false,
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
                  TitleSection(
                    color: color,
                    textStyle: textStyle,
                    mainTitle: 'Pilih Layanan',
                    showAction: false,
                  ),
                  const SizedBox(height: 14),
                  HealthService(
                    items: services,
                    color: color,
                    textStyle: textStyle,
                  ),
                  const SizedBox(height: 80),
                  AppInfo(
                    color: color,
                    textStyle: textStyle,
                    title: 'Posyandu Digital - Versi 1.0.0',
                    subTitle: '2025 - Pemerintah Desa Tondomulyo',
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
