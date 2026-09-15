import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeroBanner extends StatelessWidget {
  final String imageAsset;
  final String overline;
  final String title;
  const HomeHeroBanner({
    super.key,
    this.imageAsset = 'assets/images/b.jpg',
    this.overline = 'Ketenangan Rumah Tinggal',
    this.title = 'Ruang Bersih, Jiwa Tenang',
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage(imageAsset), fit: BoxFit.cover),
          ),
        ),
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(overline,
                    style: GoogleFonts.plusJakartaSans(
                        color: Colors.white, fontSize: 14, fontWeight: FontWeight.w200, letterSpacing: 2)),
                Text(title,
                    style: GoogleFonts.notoSerif(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w300)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
