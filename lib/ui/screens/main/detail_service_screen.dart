import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/ui/custom/scaffold_custom.dart';
import 'package:posyandu_digital_app/models/service_item.dart';
import 'package:posyandu_digital_app/ui/widget/main/header_detail.dart';
import 'package:posyandu_digital_app/ui/widget/main/title_section.dart';

class DetailServiceScreen extends StatefulWidget {
  final ServiceItem service;
  const DetailServiceScreen({super.key, required this.service});

  @override
  State<DetailServiceScreen> createState() => _DetailServiceScreenState();
}

class _DetailServiceScreenState extends State<DetailServiceScreen> {
  // Variable
  late final ServiceItem service;
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> isScrollingNotifier = ValueNotifier(false);

  // Get Theme
  ColorScheme get color => Theme.of(context).colorScheme;
  TextTheme get textStyle => Theme.of(context).textTheme;

  // Lifecycle
  @override
  void initState() {
    super.initState();
    service = widget.service;
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
                      leading: isScrolling
                          ? IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: color.onSurface,
                                size: 22,
                              ),
                            )
                          : const SizedBox.shrink(),
                      leadingWidth: isScrolling ? 56 : 0,
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
                          'Layanan ${service.title}',
                          style: textStyle.titleMedium?.copyWith(
                            color: color.onSurface,
                            fontSize: 19.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          padding: const EdgeInsets.only(top: 15, bottom: 38),
                          alignment: Alignment.bottomLeft,
                          child: HeaderDetail(
                            color: color,
                            textStyle: textStyle,
                            mainTitle: 'Layanan ${service.title}',
                            showActions: true,
                            onBack: Navigator.of(context).pop,
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
                    mainTitle: 'Alur Pelayanan',
                    color: color,
                    textStyle: textStyle,
                    showAction: false,
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
