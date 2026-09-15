import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oskost_smartkost/core/constants/app_colors.dart';

class GreetingSection extends StatelessWidget {
  final String name;
  const GreetingSection({super.key, required this.name});

  String get _greeting {
    final h = DateTime.now().hour;
    if (h < 11) return 'Selamat Pagi,';
    if (h < 15) return 'Selamat Siang,';
    if (h < 18) return 'Selamat Sore,';
    return 'Selamat Malam,';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _greeting,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.textMuted,
          ),
        ),
        Text(
          name,
          style: GoogleFonts.notoSerif(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: AppColors.neutral,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
