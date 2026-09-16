import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oskost_smartkost/app/router/route_paths.dart';
import 'package:oskost_smartkost/core/constants/app_colors.dart';
import 'package:oskost_smartkost/core/widget/sheets/app_pill.dart';

class AppShell extends StatelessWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  static const _tabs = ['/home', '/invoices', '/reports', '/profile'];

  int _index(BuildContext context) {
    final loc = GoRouterState.of(context).uri.toString();
    if (loc.startsWith('/invoices')) return 1;
    if (loc.startsWith('/reports')) return 2;
    if (loc.startsWith('/profile')) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final idx = _index(context);
    // ponytail: count dummy dari query ?count= ; ganti ke provider/auth saat API siap
    final count = int.tryParse(GoRouterState.of(context).uri.queryParameters['count'] ?? '') ?? 10;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('OsKost', style: GoogleFonts.notoSerif(fontSize: 32, fontWeight: FontWeight.w500)),
            const SizedBox(width: 6),
            AppPill(
              background: Colors.green.withValues(alpha: 0.2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.circle, size: 12, color: AppColors.neutral),
                  const SizedBox(width: 6),
                  Text('KAMAR $count', style: GoogleFonts.plusJakartaSans(fontSize: 12, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/icons/notif.png', width: 22, height: 22, color: AppColors.neutral),
            tooltip: 'Open Notification',
            onPressed: () => context.go(RoutePaths.notifications),
          ),
          CircleAvatar(
            radius: 20,
            child: ClipOval(child: Image.asset('assets/images/e.jpg', width: 80, height: 80, fit: BoxFit.cover)),
          ),
          const SizedBox(width: 8),
        ],
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: const Color.fromARGB(6, 0, 0, 0), height: 2),
        ),
      ),
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: idx,
        onDestinationSelected: (i) => context.go(_tabs[i]),
        backgroundColor: AppColors.backgroundLight,
        indicatorColor: AppColors.primaryBrown,
        destinations: [
          NavigationDestination(
            icon: Image.asset('assets/icons/home.png', width: 22, height: 22, color: AppColors.primaryBrown),
            selectedIcon: Image.asset('assets/icons/home.png', color: AppColors.neutral, width: 22, height: 22),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined, color: AppColors.primaryBrown),
            selectedIcon: Icon(Icons.receipt_long, color: AppColors.neutral),
            label: 'Tagihan',
          ),
          NavigationDestination(
            icon: Icon(Icons.report_outlined, color: AppColors.primaryBrown),
            selectedIcon: Icon(Icons.report, color: AppColors.neutral),
            label: 'Laporan',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline, color: AppColors.primaryBrown),
            selectedIcon: Icon(Icons.person, color: AppColors.neutral),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
