import 'package:flutter/material.dart';
import 'package:oskost_smartkost/core/constants/app_colors.dart';

/// Judul section dengan aksen garis vertikal kecil di kiri, plus
/// label jumlah item opsional di kanan.
class SectionHeading extends StatelessWidget {
  final String title;
  final String? trailingLabel;

  const SectionHeading({super.key, required this.title, this.trailingLabel});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 14,
              decoration: BoxDecoration(
                color: AppColors.primaryContainer,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              title.toUpperCase(),
              style: textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        if (trailingLabel != null)
          Text(trailingLabel!, style: textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w400)),
      ],
    );
  }
}
