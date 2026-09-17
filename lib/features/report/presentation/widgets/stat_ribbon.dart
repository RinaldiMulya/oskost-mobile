import 'package:flutter/material.dart';
import 'package:oskost_smartkost/core/constants/app_colors.dart';

/// Kartu ringkasan dua-kolom dengan divider di tengah, dipakai untuk
/// menampilkan "Laporan Aktif" vs "Terselesaikan".
class StatRibbon extends StatelessWidget {
  final List<StatRibbonItem> items;

  const StatRibbon({super.key, required this.items})
      : assert(items.length == 2, 'StatRibbon dirancang untuk 2 item');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.outlineVariant.withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(child: _StatColumn(item: items[0])),
            VerticalDivider(
              width: 32,
              thickness: 1,
              color: AppColors.outlineVariant.withValues(alpha: 0.3),
            ),
            Expanded(child: _StatColumn(item: items[1])),
          ],
        ),
      ),
    );
  }
}

class StatRibbonItem {
  final String label;
  final String value;
  final String unit;
  final Color dotColor;
  final bool pulsing;

  const StatRibbonItem({
    required this.label,
    required this.value,
    required this.unit,
    required this.dotColor,
    this.pulsing = false,
  });
}

class _StatColumn extends StatelessWidget {
  final StatRibbonItem item;
  const _StatColumn({required this.item});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(color: item.dotColor, shape: BoxShape.circle),
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                item.label.toUpperCase(),
                style: textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(item.value, style: textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w400)),
            const SizedBox(width: 6),
            Text(item.unit, style: textTheme.bodySmall),
          ],
        ),
      ],
    );
  }
}
