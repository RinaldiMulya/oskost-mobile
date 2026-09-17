import 'package:flutter/material.dart';
import 'package:oskost_smartkost/features/report/presentation/widgets/page_intro_header.dart';
import 'package:oskost_smartkost/features/report/presentation/widgets/primary_cta_button.dart';
import '../widgets/guide_info_card.dart';
import '../widgets/status_report_card.dart';
// ponytail: GET /api/v1/reports?page&status
class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    authGuard.login(); // ponytail: ganti POST /api/v1/auth/token saat backend siap
    context.go(RoutePaths.home);
  }

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            PageIntroHeader(eyebrow: 'Pemeliharaan Kamar 005', title: 'Lapor Kerusakan', description: "Ajukan keluhan kerusakan fasilitas kamar atau area kost. Tim pengelola siap memulihkan kenyamanan ruang Anda."),
            ElevatedButton(
              onPressed: AboutDialog.adaptive,
              child: Text('+ Laporan Kerusakan Baru')),
            SizedBox(height: 24),
            StatusReportCard(),
            SizedBox(height: 24),
            GuideinfoCard(),
            SizedBox(height: 16),
            PrimaryCtaButton(
              label: '+ Lapor Kerusakan Baru',
              onPressed (_submit)
            )
          ],
        ),
      ),
    );
  }
}
