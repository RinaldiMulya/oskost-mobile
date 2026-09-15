import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oskost_smartkost/core/constants/app_colors.dart';

class ContractDurationCard extends StatelessWidget {
  final DateTime endDate;
  final DateTime startDate;
  const ContractDurationCard({
    super.key,
    required this.endDate,
    required this.startDate,
  });

  // ponytail: hitung hari real; ganti ke data GET /api/v1/contract
  int get _daysLeft => endDate.difference(DateTime.now()).inDays.clamp(0, 9999);
  double get _progress {
    final total = endDate.difference(startDate).inDays;
    if (total <= 0) return 0;
    return (_daysLeft / total).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final urgent = _daysLeft <= 7;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: urgent ? AppColors.warningWash : AppColors.surfaceCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: urgent ? AppColors.warning : AppColors.borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: urgent ? Colors.white : AppColors.fillTerracotta,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.hourglass_bottom_rounded,
                    size: 20, color: urgent ? AppColors.warning : AppColors.primaryBrown),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Masa Kontrak',
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 1, color: AppColors.textMuted)),
                    Text('$_daysLeft hari lagi',
                        style: GoogleFonts.notoSerif(
                            fontSize: 20, fontWeight: FontWeight.w700, color: urgent ? AppColors.warningText : AppColors.neutral)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: urgent ? AppColors.warning : AppColors.successWash,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(urgent ? 'SEGERA HABIS' : 'AKTIF',
                    style: GoogleFonts.plusJakartaSans(
                        fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: _progress,
              minHeight: 6,
              backgroundColor: Colors.black.withOpacity(0.08),
              valueColor: AlwaysStoppedAnimation(urgent ? AppColors.warning : AppColors.success),
            ),
          ),
          const SizedBox(height: 8),
          Text('Berakhir ${_fmt(endDate)} • Mulai ${_fmt(startDate)}',
              style: GoogleFonts.plusJakartaSans(fontSize: 12, color: AppColors.textMuted)),
        ],
      ),
    );
  }

  String _fmt(DateTime d) => '${d.day} ${_mon(d.month)} ${d.year}';
  String _mon(int m) => const ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'][m - 1];
}
