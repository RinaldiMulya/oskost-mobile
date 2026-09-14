import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

import 'dart:ui';

import 'package:oskost_smartkost/constants/app_colors.dart';
import 'package:oskost_smartkost/features/auth/presentation/widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _identityController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obsecurePassword = true;
  bool _rememberSession = false;
  bool isChecked = false;

  @override
  void dispose() {
    _identityController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.light_rounded,
                color: AppColors.secondaryGreen,
                size: 32,
              ),
              const SizedBox(width: 2),
              Text(
                'OsKost',
                style: GoogleFonts.notoSerif(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _HeroWelcomeSection(), // image rounded, full di dalam padding
              const SizedBox(height: 16),
              LoginForm(), // kartu putih form
              const SizedBox(height: 16),
              _NewTenantInfoCard(), // kartu putih penghuni baru
              const SizedBox(height: 24),
              _FooterVersion(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _HeroWelcomeSection() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== HERO =====
          SizedBox(
            height: 144,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset('assets/images/b.jpg', fit: BoxFit.cover),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.5, 1.0],
                      colors: [
                        Colors.transparent,
                        Color.fromARGB(255, 255, 255, 255),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 12,
                  child: _pill(
                    background: Colors.white.withValues(alpha: 0.1),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 15,
                          color: AppColors.secondaryGreen,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'RUANG PENGHUNI',
                          style: GoogleFonts.plusJakartaSans(
                            color: AppColors.secondaryGreen,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ===== WELCOME =====
          Container(
            color: const Color.fromARGB(255, 235, 140, 100),
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                _pill(
                  background: Colors.white.withValues(alpha: 0.25),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.verified_user,
                        size: 15,
                        color: AppColors.secondaryGreen,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'OsKost Pulo Jahe • Akses Eksklusif Penghuni',
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.neutral,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Selamat Datang Kembali',
                  style: GoogleFonts.notoSerif(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.neutral,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Masuk ke ruang hunian Anda untuk memeriksa tagihan berkala, '
                  'kenyamanan kamar, serta kabar komunitas kost.',
                  style: GoogleFonts.plusJakartaSans(
                    color: AppColors.neutral,
                    height: 1.4,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// Widget _LoginFormCard() {
//   return Container(
//     // margin: const EdgeInsets.all(16),
//     padding: const EdgeInsets.all(20),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(20),
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Text(
//           'IDENTITAS PENGHUNI',
//           style: GoogleFonts.plusJakartaSans(
//             color: AppColors.secondaryGreen,
//             fontSize: 12,
//             fontWeight: FontWeight.w800,
//             letterSpacing: 0.5,
//           ),
//         ),
//         Text(
//           'LUPA SANDI ?',
//           style: GoogleFonts.plusJakartaSans(
//             color: AppColors.secondaryGreen,
//             fontSize: 12,
//             fontWeight: FontWeight.w800,
//             letterSpacing: 0.5,
//           ),
//         ),
//         Text(
//           'KATA SANDI',
//           style: GoogleFonts.plusJakartaSans(
//             color: AppColors.secondaryGreen,
//             fontSize: 12,
//             fontWeight: FontWeight.w800,
//             letterSpacing: 0.5,
//           ),
//         ),
//         const SizedBox(height: 8),
//         LoginForm(),
//         const SizedBox(height: 8),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               //checkbox
//               Checkbox(
//                 value: isChecked,
//                 onChanged: (bool? value) {
//                   setState(() {
//                     isChecked = value ?? false;
//                   });
//                 },
//               ),

//               const Expanded(
//                 child: Text(
//                   'Simpan sesi di perangkat ini',
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//               ),

//               const Row(
//                 children: [
//                   Icon(Icons.lock, color: Colors.green),
//                   SizedBox(width: 4.0), // Jarak kecil antara ikon dan teks
//                   Text('Terenkripsi', style: TextStyle(color: Colors.green)),
//                 ],
//               ),
//             ],
//             // text
//             // icon enkripsi plus text
//           ),
//         ),
//       ],
//     ),
//   );
// }

Widget _QuickAccessRow() {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 16),
    padding: const EdgeInsets.all(16),
    color: Colors.grey[200],
    child: const Text("TEST _QuickAccessRow"),
  );
}

Widget _NewTenantInfoCard() {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.all(16),
    color: Colors.grey[200],
    child: const Text("TEST _NewTenantInfoCard"),
  );
}

Widget _FooterVersion() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: const Text("TEST _FooterVersion", textAlign: TextAlign.center),
  );
}

class _pill extends StatelessWidget {
  final Widget child;
  final Color background;
  final double borderRadius;

  const _pill({
    required this.child,
    required this.background,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    final bool isGlass = background == Colors.transparent || background.a < 1.0;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: isGlass ? 4.0 : 0.0,
          sigmaY: isGlass ? 2.0 : 0.0,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(20),
            border: isGlass
                ? Border.all(
                    color: Colors.white.withValues(alpha: 0.2),
                    width: 1.0,
                  )
                : null,
          ),
          child: child,
        ),
      ),
    );
  }
}
