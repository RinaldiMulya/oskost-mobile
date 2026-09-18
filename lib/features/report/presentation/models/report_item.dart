enum ReportStatus { open, resolved }

/// Merepresentasikan satu kartu laporan kerusakan (baik yang masih
/// "Terbuka" maupun yang sudah "Selesai").
class ReportItem {
  final String id;
  final String category;
  final String title;
  final String description;
  final ReportStatus status;
  final DateTime reportedAt;

  /// Hanya relevan untuk status [ReportStatus.open]
  final String? photoUrl;
  final String? scheduleLabel;
  final double? progress; // 0.0 - 1.0

  /// Hanya relevan untuk status [ReportStatus.resolved]
  final String? resolvedByName;
  final String? resolutionNote;

  const ReportItem({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.status,
    required this.reportedAt,
    this.photoUrl,
    this.scheduleLabel,
    this.progress,
    this.resolvedByName,
    this.resolutionNote,
  });
}
