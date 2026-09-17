import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oskost_smartkost/core/constants/app_colors.dart';

/// Baris footer kecil berisi ID tiket dan tanggal laporan dibuat.
class ReportMetaFooter extends StatelessWidget {
  final String id;
  final DateTime reportedAt;

  const ReportMetaFooter({
    super.key,
    required this.id,
    required this.reportedAt,
  });

  String get _formattedDate =>
      '${DateFormat('d MMM yyyy', 'id_ID').format(reportedAt)}, '
      '${DateFormat('HH.mm', 'id_ID').format(reportedAt)}';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.only(top: 8),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.transparent)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text('ID:', style: textTheme.labelSmall),
              const SizedBox(width: 4),
              Text(
                '#$id',
                style: textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.onSurface,
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.history, size: 14, color: AppColors.onSurfaceVariant),
              const SizedBox(width: 4),
              Text(_formattedDate, style: textTheme.labelSmall),
            ],
          ),
        ],
      ),
    );
  }
}
