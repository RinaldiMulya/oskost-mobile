import 'package:flutter/material.dart';
import 'package:oskost_smartkost/core/constants/app_colors.dart';

/// Baris "Petugas dijadwalkan" + jam + progress bar tipis, dipakai
/// pada kartu laporan yang masih berstatus terbuka.
class ScheduleProgressTile extends StatelessWidget {
  final String statusLabel;
  final String timeLabel;
  final double progress; // 0.0 - 1.0

  const ScheduleProgressTile({
    super.key,
    required this.statusLabel,
    required this.timeLabel,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.schedule, size: 15, color: AppColors.primaryDark),
                  const SizedBox(width: 4),
                  Text(
                    statusLabel,
                    style: textTheme.labelSmall?.copyWith(
                      color: AppColors.primaryDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(timeLabel, style: textTheme.labelSmall),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: AppColors.surfaceContainerHighest,
              valueColor: const AlwaysStoppedAnimation(AppColors.primaryLight),
            ),
          ),
        ],
      ),
    );
  }
}
