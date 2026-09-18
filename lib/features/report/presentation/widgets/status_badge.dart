import 'package:flutter/material.dart';
import 'package:oskost_smartkost/core/constants/app_colors.dart';
import 'package:oskost_smartkost/features/report/model/report_item.dart';


/// Badge kecil berbentuk pill untuk status "Terbuka" (kuning/tersier)
/// atau "Selesai" (hijau/sekunder).
class StatusBadge extends StatelessWidget {
  final ReportStatus status;
  const StatusBadge({super.key, required this.status});

  bool get _isOpen => status == ReportStatus.open;

  @override
  Widget build(BuildContext context) {
    final bg = _isOpen ? AppColors.tertiaryFixed : AppColors.secondaryContainer;
    final fg = _isOpen ? AppColors.onTertiaryFixedVariant : AppColors.onSecondaryContainer;
    final dot = _isOpen ? AppColors.tertiary : AppColors.secondary;
    final label = _isOpen ? 'Terbuka' : 'Selesai';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(999)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 6, height: 6, decoration: BoxDecoration(color: dot, shape: BoxShape.circle)),
          const SizedBox(width: 6),
          Text(
            label.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: fg, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
