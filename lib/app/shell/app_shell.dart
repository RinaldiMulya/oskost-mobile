import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oskost_smartkost/core/constants/app_colors.dart';

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
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: idx,
        onDestinationSelected: (i) => context.go(_tabs[i]),
        backgroundColor: AppColors.backgroundLight,
        indicatorColor: AppColors.primaryBrown,
        destinations: [
          NavigationDestination(
            icon: Image.asset(
              'assets/icons/home.png',
              width: 22,
              height: 22,
              color: AppColors.primaryBrown,
            ),
            selectedIcon: Image.asset(
              'assets/icons/home.png',
              color: AppColors.neutral,
              width: 22,
              height: 22,
              
            ),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.receipt_long_outlined,
              color: AppColors.primaryBrown,
            ),
            selectedIcon: Icon(
              Icons.receipt_long,
              color: AppColors.neutral,
            ),
            label: 'Tagihan',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.report_outlined,
              color: AppColors.primaryBrown,
            ),
            selectedIcon: Icon(
              Icons.report,
              color: AppColors.neutral,
            ),
            label: 'Laporan',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outline,
              color: AppColors.primaryBrown,
            ),
            selectedIcon: Icon(
              Icons.person,
              color: AppColors.neutral,
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
