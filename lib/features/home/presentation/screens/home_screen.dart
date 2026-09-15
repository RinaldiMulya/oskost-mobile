import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oskost_smartkost/app/router/auth_guard.dart';
import 'package:oskost_smartkost/core/constants/app_colors.dart';
import 'package:oskost_smartkost/app/router/route_paths.dart';
import 'package:oskost_smartkost/core/widget/card/app_card_Payment.dart';
import 'package:oskost_smartkost/core/widget/footer/app_footer.dart';
import 'package:oskost_smartkost/core/widget/sheets/app_pill.dart';
import 'package:oskost_smartkost/features/home/presentation/widgets/greeting_section.dart';
import 'package:oskost_smartkost/features/home/presentation/widgets/room_info_card.dart';
import 'package:oskost_smartkost/features/home/presentation/widgets/home_hero_banner.dart';
import 'package:oskost_smartkost/features/home/presentation/widgets/contract_duration_card.dart';
import 'package:oskost_smartkost/features/home/presentation/widgets/quick_menu_grid.dart';

class HomePage extends StatefulWidget {
  final int count;
  const HomePage({super.key, this.count = 10}); // ponytail: dummy 12 for slicing; ganti ke data real GET /api/v1/me atau /rooms

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'OsKost',
              style: GoogleFonts.notoSerif(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 6),
            AppPill(
              background: Colors.green.withValues(alpha: 0.2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.circle, size: 12, color: AppColors.neutral),
                  const SizedBox(width: 6),
                  Text(
                    'KAMAR ${widget.count}',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/icons/notif.png',
              width: 22,
              height: 22,
              color: AppColors.neutral,
            ),
            tooltip: 'Open Notification',
            onPressed: () {
              authGuard.login();
              context.go(RoutePaths.notifications);
            },
          ),
          CircleAvatar(
            radius: 20,
            child: ClipOval(
              child: Image.asset(
                'assets/images/e.jpg',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 8),
        ],
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: const Color.fromARGB(6, 0, 0, 0),
            height: 2.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
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
                padding: const EdgeInsetsGeometry.symmetric(horizontal: 20,vertical: 10),
                child: QuickMenuGrid(
                  items: [
                    QuickMenuItem(
                      icon: Icons.receipt_long_outlined,
                      label: 'Tagihan',
                      onTap: () {},
                    ),
                    QuickMenuItem(
                      icon: Icons.build_outlined,
                      label: 'Komplain',
                      onTap: () {},
                    ),
                    QuickMenuItem(
                      icon: Icons.history_outlined,
                      label: 'Riwayat',
                      onTap: () {},
                    ),
                    QuickMenuItem(
                      icon: Icons.support_agent_outlined,
                      label: 'Bantuan',
                      onTap: () {},
                    ),
                    QuickMenuItem(
                      icon: Icons.calendar_month_outlined,
                      label: 'Perpanjang',
                      onTap: () {},
                    ),
                    QuickMenuItem(
                      icon: Icons.cleaning_services_outlined,
                      label: 'Kebersihan',
                      onTap: () {},
                    ),
                    QuickMenuItem(
                      icon: Icons.wifi_outlined,
                      label: 'WiFi',
                      onTap: () {},
                    ),
                    QuickMenuItem(
                      icon: Icons.more_horiz,
                      label: 'Lainnya',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              AppFooter(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
