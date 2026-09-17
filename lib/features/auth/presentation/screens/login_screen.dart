import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

import 'package:oskost_smartkost/core/constants/app_colors.dart';
import 'package:oskost_smartkost/core/widget/footer/app_footer.dart';
import 'package:oskost_smartkost/core/widget/sheets/app_pill.dart';
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
        backgroundColor: Color.fromRGBO(254, 248, 245, 100),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _HeroWelcomeSection(),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 20 ),
                child: LoginForm(),
              ),
              const SizedBox(height: 10),
              _NewTenantInfoCard(),
              const SizedBox(height: 10),
              AppFooter(),
              const SizedBox(height: 10),
              // ponytail: training debug only, hapus saat rilis
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: OutlinedButton(
                  onPressed: () => context.go('/training/login'),
                  child: const Text('🧪 Buka Training Login'),
                ),
              ),
              const SizedBox(height: 10),
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
                Image.asset('assets/images/e.jpg', fit: BoxFit.cover),
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
                  child: AppPill(
                    background: Colors.white.withValues(alpha: 0.1),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 15,
                          color: Color.fromARGB(255, 255, 0, 0),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'RUANG PENGHUNI',
                          style: GoogleFonts.plusJakartaSans(
                            color: AppColors.neutral,
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
            color: const Color.fromRGBO(248, 124, 62, 100),
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                AppPill(
                  background: Colors.white.withValues(alpha: 0.25),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.shield_outlined,
                            size: 23,
                            color: AppColors.secondaryGreen,
                          ),
                          Positioned(
                            top: 3,
                            child: Icon(
                              Icons.person,
                              size: 16,
                              color: AppColors.secondaryGreen,
                            ),
                          ),
                        ],
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

Widget _NewTenantInfoCard() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFFF3EBE1),
      // borderRadius: BorderRadius.circular(18),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundColor: Color(0xFFF1C7A0),
          child: Icon(Icons.location_on_outlined, color: Colors.brown),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Penghuni Baru? ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' • Tanpa Registrasi Mandiri'),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Akun hunian dan kunci digital disiapkan langsung oleh '
                'pengelola saat serah terima kunci fisik kamar Anda.',
                style: TextStyle(color: Colors.black54, fontSize: 13),
              ),
              const SizedBox(height: 10),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.support_agent_outlined,
                  size: 18,
                  color: AppColors.primaryBrown,
                ),
                label: const Text(
                  'Hubungi Ibu Ayu (Pengelola Kost)',
                  style: TextStyle(
                    color: AppColors.primaryBrown
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


