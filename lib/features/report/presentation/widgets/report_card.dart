import 'package:flutter/material.dart';
import 'package:oskost_smartkost/features/report/model/report_item.dart';
import 'package:oskost_smartkost/core/constants/app_colors.dart';
import 'attachment_photo_frame.dart';
import 'report_meta_footer.dart';
import 'resolution_note_tile.dart';
import 'schedule_progress_tile.dart';
import 'status_badge.dart';

/// Kartu satu laporan kerusakan, otomatis menampilkan bagian yang
/// relevan tergantung [ReportItem.status]:
/// - open   -> foto lampiran + progress jadwal petugas
/// - resolved -> catatan resolusi
class ReportCard extends StatelessWidget {
  final ReportItem item;
  final VoidCallback? onTap;

  const ReportCard({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isOpen = item.status == ReportStatus.open;

    return Material(
      color: AppColors.primaryWash,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 6),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: status badge + kategori
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatusBadge(status: item.status),
                  Text(item.category, style: textTheme.labelSmall),
                ],
              ),
              const SizedBox(height: 12),

              // Judul & deskripsi
              Text(item.title, style: textTheme.headlineSmall),
              const SizedBox(height: 4),
              Text(item.description, style: textTheme.bodyMedium?.copyWith(height: 1.6)),
              const SizedBox(height: 12),

              // Bagian dinamis sesuai status
              if (isOpen && item.photoUrl != null) ...[
                AttachmentPhotoFrame(imageUrl: item.photoUrl!),
                const SizedBox(height: 12),
              ],
              if (isOpen && item.scheduleLabel != null) ...[
                ScheduleProgressTile(
                  statusLabel: 'Petugas dijadwalkan',
                  timeLabel: item.scheduleLabel!,
                  progress: item.progress ?? 0,
                ),
                const SizedBox(height: 12),
              ],
              if (!isOpen && item.resolvedByName != null) ...[
                ResolutionNoteTile(
                  handlerName: item.resolvedByName!,
                  note: item.resolutionNote ?? '',
                ),
                const SizedBox(height: 12),
              ],

              // Footer metadata
              ReportMetaFooter(id: item.id, reportedAt: item.reportedAt),
            ],
          ),
        ),
      ),
    );
  }
}
