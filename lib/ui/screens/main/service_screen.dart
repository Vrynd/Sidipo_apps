import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/ui/widget/form/adult_form_app.dart';
import 'package:posyandu_digital_app/ui/widget/form/eldery_form_app.dart';
import 'package:posyandu_digital_app/ui/widget/form/school_teenager_form_app.dart';
import 'package:provider/provider.dart';
import 'package:posyandu_digital_app/provider/checkup/checkup_provider.dart';
import 'package:posyandu_digital_app/provider/checkup/resident_provider.dart';
import 'package:posyandu_digital_app/ui/custom/scaffold_custom.dart';
import 'package:posyandu_digital_app/ui/widget/form/pregnant_form_app.dart';
import 'package:posyandu_digital_app/ui/widget/form/resident_form_app.dart';
import 'package:posyandu_digital_app/ui/widget/form/toddler_form_app.dart';
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
  late final TabController _tabController;
  final ValueNotifier<bool> _isScrolling = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController.addListener(() {
      _isScrolling.value = _scrollController.offset > 10;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    _isScrolling.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }
  }

  Widget _buildForm(String serviceName) {
    switch (serviceName) {
      case 'Ibu Hamil dan Nifas':
        return const PregnantFormApp();
      case 'Bayi atau Balita':
        return const ToddlerFormApp();
      case 'Sekolah atau Remaja':
        return const SchoolTeenagerFormApp();
      case 'Dewasa':
        return const AdultFormApp();
      case 'Lansia':
        return const ElederyFormApp();
      default:
        return const Center(
          child: Text('Formulir belum tersedia untuk layanan ini'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final serviceName =
        ModalRoute.of(context)?.settings.arguments as String? ?? 'Layanan';
    final residentProvider = context.read<ResidentProvider>();
    final checkupProvider = context.read<CheckUpProvider>();

    return ScaffoldCustom(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: ValueListenableBuilder<bool>(
          valueListenable: _isScrolling,
          builder: (context, isScrolling, _) => AppBar(
            centerTitle: true,
            scrolledUnderElevation: 0,
            backgroundColor: isScrolling
                ? Theme.of(context).colorScheme.surfaceContainerLowest
                : Theme.of(context).colorScheme.surface,
            title: AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: isScrolling ? 1.0 : 0.0,
              child: Text(
                serviceName,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              onPressed: () => Navigator.pop(context),
            ),
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

            Selector2<ResidentProvider, CheckUpProvider, double>(
              selector: (context, r, c) =>
                  ((r.progress + c.progress) / 2).clamp(0.0, 1.0),
              builder: (context, progress, _) => ProgressIndicatorApp(
                title: progress >= 1.0 ? 'Selesai' : 'Progress',
                currentStep: _tabController.index + 1,
                totalSteps: 2,
                progress: progress,
              ),
            ),
            const SizedBox(height: 16),

            Selector<ResidentProvider, bool>(
              selector: (_, res) => res.progress >= 1.0,
              builder: (context, canAccessCheckup, _) => ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: IgnorePointer(
                  ignoring: !canAccessCheckup,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      labelColor: Theme.of(context).colorScheme.primary,
                      unselectedLabelColor: Theme.of(
                        context,
                      ).colorScheme.onSurfaceVariant,
                      tabs: const [
                        TabBarApp(title: 'Pendaftaran', count: 12),
                        TabBarApp(title: 'Pemeriksaan', count: 10),
                      ],
                      onTap: (_) => _scrollToTop(),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            AnimatedBuilder(
              animation: _tabController,
              builder: (context, _) => IndexedStack(
                index: _tabController.index,
                children: [const ResidentFormApp(), _buildForm(serviceName)],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Selector2<ResidentProvider, CheckUpProvider, double>(
        selector: (context, r, c) =>
            ((r.progress + c.progress) / 2).clamp(0.0, 1.0),
        builder: (context, totalProgress, _) {
          final isComplete = totalProgress >= 1.0;
          final onSurface = Theme.of(context).colorScheme.onSurface;

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
                      content: Text('Lengkapi data pendaftaran dahulu.'),
                    ),
                  );
                  return;
                }
                _tabController.animateTo(1);
                _scrollToTop();
              } else {
                if (!isComplete) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Lengkapi semua data terlebih dahulu.'),
                    ),
                  );
                  return;
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primaryContainer,
                    content: Text(
                      'Data berhasil dikirim!',
                      style: TextStyle(color: onSurface),
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
