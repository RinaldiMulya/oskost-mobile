import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oskost_smartkost/app/router/route_paths.dart';
import 'package:oskost_smartkost/core/widget/footer/app_footer.dart';
import 'package:oskost_smartkost/features/report/presentation/widgets/emergency_footer.dart';
import 'package:oskost_smartkost/features/report/presentation/widgets/page_intro_header.dart';
import 'package:oskost_smartkost/features/report/presentation/widgets/primary_cta_button.dart';
import 'package:oskost_smartkost/features/report/presentation/widgets/report_card.dart';
import 'package:oskost_smartkost/features/report/presentation/widgets/schedule_progress_tile.dart';
import '../widgets/guide_info_card.dart';
import '../widgets/status_report_card.dart';
import 'package:oskost_smartkost/features/report/model/report_item.dart';
// ponytail: GET /api/v1/reports?page&status
class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
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
            ReportCard(
              item: ReportItem(
                id: 'RPT-001',
                category: 'Fasilitas Kamar',
                title: 'AC Bocor Menetes',
                description: 'AC meneteskan air ke lantai sejak semalam, mohon segera dicek karena membasahi barang-barang saya.',
                status: ReportStatus.open,
                reportedAt: DateTime.now().subtract(const Duration(hours: 2)),
                photoUrl: 'assets/images/b.jpg',
                progress: 0.23,
                scheduleLabel: 'Hari ini, 14:30',
              ),
              onTap: () => context.push(RoutePaths.reportDetail('RPT-001')),
            ),
            const SizedBox(height: 16),
            ReportCard(
              item: ReportItem(
                id: 'RPT-002',
                category: 'Fasilitas Parkir',
                title: 'Parkiran sempit',
                description: 'Parkiran disini sempit kamar saya jadi bagian dari parkiran jika ingin aman seharusnya ada cctv dan gerbang harus ada gembok bagi para penghuni',
                status: ReportStatus.resolved,
                reportedAt: DateTime.now().subtract(const Duration(hours: 2)),
                resolvedByName: 'Luvia nuraini',
                resolutionNote: 'BAU BELUM MANDI'
              ),
              onTap: () => context.push(RoutePaths.reportDetail('RPT-001')),
            ),
            const SizedBox(height: 24),
            EmergencyFooter(description: 'Untuk kebocoran besar, korsleting listrik mendesak, atau kendala kunci, hubungi penjaga jaga kost langsung melalui tombol panggil darurat.'),
            const SizedBox(height: 16),
            AppFooter(),
          ],
        ),
      ),
    );
  }
}
