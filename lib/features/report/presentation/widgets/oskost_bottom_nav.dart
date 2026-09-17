import 'package:flutter/material.dart';
import 'package:oskost_smartkost/core/constants/app_colors.dart';

class OsKostNavItem {
  final IconData icon;
  final String label;
  const OsKostNavItem({required this.icon, required this.label});
}

/// Bottom navigation bar custom (4 menu tetap: Beranda, Tagihan,
/// Laporan, Profil) dengan indikator warna untuk item aktif.
class OsKostBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  static const items = [
    OsKostNavItem(icon: Icons.cottage_outlined, label: 'Beranda'),
    OsKostNavItem(icon: Icons.receipt_long_outlined, label: 'Tagihan'),
    OsKostNavItem(icon: Icons.local_florist_outlined, label: 'Laporan'),
    OsKostNavItem(icon: Icons.account_circle_outlined, label: 'Profil'),
  ];

  const OsKostBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.9),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 16, offset: const Offset(0, -2)),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              final isActive = index == currentIndex;
              final item = items[index];
              return _NavButton(
                item: item,
                active: isActive,
                onTap: () => onTap(index),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final OsKostNavItem item;
  final bool active;
  final VoidCallback onTap;

  const _NavButton({required this.item, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = active ? AppColors.primaryContainer : AppColors.onSurfaceVariant;
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 64,
        height: 56,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon, size: 22, color: color),
            const SizedBox(height: 2),
            Text(
              item.label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: color,
                    fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
