import 'package:flutter/material.dart';
import 'package:oskost_smartkost/core/widget/card/app_card_Payment.dart';
import 'package:oskost_smartkost/core/widget/footer/app_footer.dart';
import 'package:oskost_smartkost/features/home/presentation/widgets/greeting_section.dart';
import 'package:oskost_smartkost/features/home/presentation/widgets/room_info_card.dart';
import 'package:oskost_smartkost/features/home/presentation/widgets/home_hero_banner.dart';
import 'package:oskost_smartkost/features/home/presentation/widgets/contract_duration_card.dart';
import 'package:oskost_smartkost/features/home/presentation/widgets/quick_menu_grid.dart';

class HomePage extends StatelessWidget {
  final int count;
  const HomePage({super.key, this.count = 10}); // ponytail: count tidak dipakai lagi (AppBar di AppShell); simpan untuk kompatibilitas route ?count=

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GreetingSection(name: 'Rinaldi Mulya Pratama'),
            const SizedBox(height: 24),
            const RoomInfoCard(),
            const SizedBox(height: 16),
            const HomeHeroBanner(),
            const SizedBox(height: 16),
            ContractDurationCard(
              startDate: DateTime(2025, 9, 15),
              endDate: DateTime(2026, 10, 15),
            ),
            const SizedBox(height: 16),
            AppCardPayment(
              bulanTagihan: 'September 2026',
              jumlahTagihan: 'Rp 2.528.000',
              jatuhTempo: '6 Sep 2026',
              status: 'BELUM BAYAR',
              onBayar: () {
                print('Tombol bayar diklik!');
              },
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 10),
              child: QuickMenuGrid(
                items: [
                  QuickMenuItem(icon: Icons.receipt_long_outlined, label: 'Tagihan', onTap: () {}),
                  QuickMenuItem(icon: Icons.build_outlined, label: 'Komplain', onTap: () {}),
                  QuickMenuItem(icon: Icons.history_outlined, label: 'Riwayat', onTap: () {}),
                  QuickMenuItem(icon: Icons.support_agent_outlined, label: 'Bantuan', onTap: () {}),
                  QuickMenuItem(icon: Icons.calendar_month_outlined, label: 'Perpanjang', onTap: () {}),
                  QuickMenuItem(icon: Icons.cleaning_services_outlined, label: 'Kebersihan', onTap: () {}),
                  QuickMenuItem(icon: Icons.wifi_outlined, label: 'WiFi', onTap: () {}),
                  QuickMenuItem(icon: Icons.more_horiz, label: 'Lainnya', onTap: () {}),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const AppFooter(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
