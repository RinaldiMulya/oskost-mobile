import 'package:flutter/material.dart';
import 'package:oskost_smartkost/core/constants/app_colors.dart';

/// Kotak catatan "Telah Ditangani oleh ..." pada kartu laporan yang
/// sudah selesai.
class ResolutionNoteTile extends StatelessWidget {
  final String handlerName;
  final String note;

  const ResolutionNoteTile({
    super.key,
    required this.handlerName,
    required this.note,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, size: 18, color: AppColors.secondary),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Telah Ditangani $handlerName', style: textTheme.titleMedium),
                Text(note, style: textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
