import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oskost_smartkost/app/router/route_paths.dart';
import 'package:oskost_smartkost/features/report/presentation/widgets/page_intro_header.dart';
import 'package:oskost_smartkost/features/report/presentation/widgets/primary_cta_button.dart';
import '../widgets/guide_info_card.dart';
import '../widgets/status_report_card.dart';
// ponytail: GET /api/v1/reports?page&status
class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const PageIntroHeader(eyebrow: 'Pemeliharaan Kamar 005', title: 'Lapor Kerusakan', description: "Ajukan keluhan kerusakan fasilitas kamar atau area kost. Tim pengelola siap memulihkan kenyamanan ruang Anda."),
            const SizedBox(height: 24),
            PrimaryCtaButton(
              label: 'Lapor Kerusakan Baru',
              onPressed: () => context.push(RoutePaths.reportNew),
            ),
            const SizedBox(height: 24),
            const StatusReportCard(),
            const SizedBox(height: 24),
            const GuideinfoCard(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
