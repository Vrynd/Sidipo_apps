import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/provider/village_identity_provider.dart';
import 'package:posyandu_digital_app/ui/custom/scaffold_custom.dart';
import 'package:posyandu_digital_app/ui/widget/main/alert_app.dart';
import 'package:posyandu_digital_app/ui/widget/main/header_app.dart';
import 'package:posyandu_digital_app/ui/widget/main/identity_form_app.dart';
import 'package:posyandu_digital_app/ui/widget/main/progress_indicator_app.dart';
import 'package:posyandu_digital_app/ui/widget/main/save_button_app.dart';
import 'package:provider/provider.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolling = false;

  @override
  Widget build(BuildContext context) {
    final serviceName = ModalRoute.of(context)!.settings.arguments as String;
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
        behavior: const ScrollBehavior().copyWith(
          overscroll: false,
          physics: const BouncingScrollPhysics(),
        ),
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.only(
            top: 0,
            left: 22,
            right: 22,
            bottom: 22,
          ),
          children: [
            HeaderApp(title: serviceName, showAvatar: false),
            const SizedBox(height: 10),

            Consumer<VillageIdentityProvider>(
              builder: (context, provider, child) {
                return ProgressIndicatorApp(
                  currentStep: 1,
                  totalSteps: 2,
                  progress: provider.progress,
                );
              },
            ),
            const SizedBox(height: 30),

            Text(
              'Informasi Dasar',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            SizedBox(height: 14),

            AlertApp(
              message:
                  'Pastikan seluruh data diisi dengan benar sesuai KTP agar tidak terjadi kesalahan dalam pendataan.',
              type: AlertType.info,
            ),
            const SizedBox(height: 20),

            const IdentityFormApp(),
          ],
        ),
      ),
      bottomNavigationBar: SaveButtonApp(
        titleAction: 'Simpan Data',
        onSave: () {},
        onReset: () {
          context.read<VillageIdentityProvider>().clearForm();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    final scrolling = offset > 10;
    if (scrolling != _isScrolling) {
      setState(() => _isScrolling = scrolling);
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}
