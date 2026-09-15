import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oskost_smartkost/core/constants/app_colors.dart';

class QuickMenuItem {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  const QuickMenuItem({required this.icon, required this.label, this.onTap});
}

class QuickMenuGrid extends StatelessWidget {
  final List<QuickMenuItem> items;
  const QuickMenuGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Akses Cepat',
            style: GoogleFonts.plusJakartaSans(
                fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1.2, color: AppColors.textMuted)),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            childAspectRatio: 0.85,
          ),
          itemCount: items.length,
          itemBuilder: (_, i) {
            final it = items[i];
            return InkWell(
              onTap: it.onTap,
              borderRadius: BorderRadius.circular(16),
              child: Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceCard,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.borderSubtle),
                    ),
                    child: Icon(it.icon, size: 26, color: AppColors.primaryBrown),
                  ),
                  const SizedBox(height: 8),
                  Text(it.label,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.plusJakartaSans(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.neutral)),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
