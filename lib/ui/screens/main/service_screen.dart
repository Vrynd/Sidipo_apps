import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:posyandu_digital_app/provider/checkup/checkup_provider.dart';
import 'package:posyandu_digital_app/provider/checkup/resident_provider.dart';
import 'package:posyandu_digital_app/ui/custom/scaffold_custom.dart';
import 'package:posyandu_digital_app/ui/widget/form/checkup_form_app.dart';
import 'package:posyandu_digital_app/ui/widget/form/resident_form_app.dart';
import 'package:posyandu_digital_app/ui/widget/main/header_app.dart';
import 'package:posyandu_digital_app/ui/widget/main/progress_indicator_app.dart';
import 'package:posyandu_digital_app/ui/widget/main/save_button_app.dart';
import 'package:posyandu_digital_app/ui/widget/main/tab_bar_app.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolling = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController.addListener(_onScroll);

    _tabController.addListener(() {
      setState(() {});
      _scrollToTop();
    });
  }

  void _scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _onScroll() {
    final scrolling = _scrollController.offset > 10;
    if (scrolling != _isScrolling) {
      setState(() => _isScrolling = scrolling);
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final serviceName = ModalRoute.of(context)!.settings.arguments as String;
    final residentProvider = context.read<ResidentProvider>();
    final checkupProvider = context.read<CheckUpProvider>();

    return ScaffoldCustom(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: _isScrolling
            ? Theme.of(context).colorScheme.surfaceContainerLowest
            : Theme.of(context).colorScheme.surface,
        title: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: _isScrolling ? 1.0 : 0.0,
          child: Text(
            serviceName,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            size: 26,
            Icons.arrow_back_outlined,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
          children: [
            HeaderApp(title: serviceName, showAvatar: false),
            const SizedBox(height: 10),

            /// ✅ Hanya bagian ini yang akan rebuild saat progress berubah
            Selector2<ResidentProvider, CheckUpProvider, double>(
              selector: (context, resident, checkup) =>
                  ((resident.progress + checkup.progress) / 2).clamp(0.0, 1.0),
              builder: (context, totalProgress, _) {
                final isComplete = totalProgress >= 1.0;
                return ProgressIndicatorApp(
                  title: isComplete ? 'Selesai' : 'Progress',
                  currentStep: _tabController.index + 1,
                  totalSteps: 2,
                  progress: totalProgress,
                );
              },
            ),

            const SizedBox(height: 16),

            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 50,
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
                child: TabBar(
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  labelColor: Theme.of(context).colorScheme.primary,
                  unselectedLabelColor:
                      Theme.of(context).colorScheme.onSurfaceVariant,
                  tabs: const [
                    TabBarApp(title: 'Pendaftaran', count: 12),
                    TabBarApp(title: 'Pemeriksaan', count: 10),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            AnimatedBuilder(
              animation: _tabController,
              builder: (context, _) {
                return IndexedStack(
                  index: _tabController.index,
                  children: const [
                    ResidentFormApp(),
                    CheckupFormApp(),
                  ],
                );
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: Selector2<ResidentProvider, CheckUpProvider, double>(
        selector: (context, resident, checkup) =>
            ((resident.progress + checkup.progress) / 2).clamp(0.0, 1.0),
        builder: (context, totalProgress, _) {
          final isComplete = totalProgress >= 1.0;
          return SaveButtonApp(
            titleAction: _tabController.index == 0
                ? 'Berikutnya'
                : (isComplete ? 'Kirim Data' : 'Simpan Data'),
            isDisabled: _tabController.index == 1 && !isComplete,
            onSave: () {
              if (_tabController.index == 0) {
                if (residentProvider.progress < 1.0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('Lengkapi data pendaftaran terlebih dahulu.'),
                    ),
                  );
                  return;
                }
                _tabController.animateTo(1);
              } else {
                if (!isComplete) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Lengkapi semua data hingga progress 100% terlebih dahulu.'),
                    ),
                  );
                  return;
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    content: Text(
                      '🎉 Data berhasil dikirim!',
                      style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                );
              }
            },
            onReset: () {
              residentProvider.resetForm();
              checkupProvider.resetForm();
              _tabController.animateTo(0);
              _scrollToTop();
            },
          );
        },
      ),
    );
  }
}
