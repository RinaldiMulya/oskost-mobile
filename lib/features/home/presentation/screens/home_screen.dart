import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oskost_smartkost/app/router/auth_guard.dart';
import 'package:oskost_smartkost/core/constants/app_colors.dart';
import 'package:oskost_smartkost/app/router/route_paths.dart';
import 'package:oskost_smartkost/core/widget/sheets/app_pill.dart';

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
              // ── Greeting overline ──
              Text(
                'Selamat Pagi,',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textMuted, // #68635D
                ),
              ),
          
              // ── Nama (Noto Serif, editorial) ──
              Text(
                'Rinaldi Mulya Pratama',
                style: GoogleFonts.notoSerif(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: AppColors.neutral,
                  height: 1.2,
                ),
              ),
          
              const SizedBox(height: 24),
          
              // ── Card Kamar ──
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surfaceCard, // #EFECE6
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.borderSubtle),
                ),
                child: Row(
                  children: [
                    // Icon enclosure (taupe rounded square)
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.fillTerracotta, // terracotta 8%
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.bed_outlined,
                        size: 24,
                        color: AppColors.primaryBrown,
                      ),
                    ),
                    const SizedBox(width: 12),
          
                    // Teks kamar
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kamar 005 — VIP Suite',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.neutral,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'OsKost Pulo Jahe',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
          
                    // Badge verified (moss)
                    Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: AppColors.successWash, // #EFF2EC
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.verified_outlined,
                        size: 20,
                        color: AppColors.secondaryGreen,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
