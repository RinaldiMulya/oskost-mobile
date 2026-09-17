import 'package:flutter/material.dart';
import 'package:oskost_smartkost/core/constants/app_colors.dart';

/// Blok "Pemeliharaan Kamar 005" + judul "Lapor Kerusakan" + deskripsi.
class PageIntroHeader extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String description;

  const PageIntroHeader({
    super.key,
    required this.eyebrow,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.eco_outlined, size: 15, color: AppColors.secondary),
            const SizedBox(width: 6),
            Text(
              eyebrow,
              style: textTheme.labelMedium?.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(title, style: textTheme.headlineLarge),
        const SizedBox(height: 8),
        Text(
          description,
          style: textTheme.bodyMedium?.copyWith(height: 1.6),
        ),
      ],
    );
  }
}
