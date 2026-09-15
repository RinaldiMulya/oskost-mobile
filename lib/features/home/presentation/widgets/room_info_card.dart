import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oskost_smartkost/core/constants/app_colors.dart';

class RoomInfoCard extends StatelessWidget {
  final String roomName;
  final String location;
  final bool verified;
  const RoomInfoCard({
    super.key,
    this.roomName = 'Kamar 005 — VIP Suite',
    this.location = 'OsKost Pulo Jahe',
    this.verified = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.fillTerracotta,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.bed_outlined, size: 24, color: AppColors.primaryBrown),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(roomName,
                    style: GoogleFonts.plusJakartaSans(
                        fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.neutral)),
                const SizedBox(height: 2),
                Text(location,
                    style: GoogleFonts.plusJakartaSans(
                        fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textMuted)),
              ],
            ),
          ),
          if (verified)
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(color: AppColors.successWash, shape: BoxShape.circle),
              child: const Icon(Icons.verified_outlined, size: 20, color: AppColors.onSecondaryContainer),
            ),
        ],
      ),
    );
  }
}
