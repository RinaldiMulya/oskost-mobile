import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oskost_smartkost/constants/app_colors.dart';
import 'package:oskost_smartkost/core/widget/footer/app_footer.dart';
import 'package:oskost_smartkost/core/widget/text_field/app_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _indetityController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obsecurePassword = true;
  bool _rememberSession = false;
  bool isChecked = false;

  @override
  void dispose() => {
    _indetityController.dispose(),
    _passwordController.dispose(),
    super.dispose(),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ===== IDENTITAS =====
          _fieldLabel('IDENTITAS PENGHUNI'),
          const SizedBox(height: 8),
          AppTextField(
            controller: _indetityController,
            hintText: 'Masukkan email atau nomor WA',
            prefixIcon: Icons.meeting_room_rounded,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          // ===== KATA SANDI =====
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_fieldLabel('KATA SANDI'), _forgotPasswordButton()],
          ),
          const SizedBox(height: 8),
          AppTextField(
            controller: _passwordController,
            hintText: '•••••••••••',
            prefixIcon: Icons.key_sharp,
            obscureText: _obsecurePassword,
            textInputAction: TextInputAction.done,
            suffixIcon: IconButton(
              icon: Icon(
                _obsecurePassword
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded,
              ),
              onPressed: () =>
                  setState(() => _obsecurePassword = !_obsecurePassword),
            ),
          ),
          const SizedBox(height: 8),
          // ===== SIMPAN SESI =====
          _rememberSessionRow(),
          const SizedBox(height: 8),
          // ===== Submit Button =====
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBrown,
              foregroundColor: Colors.white,
              shadowColor: Colors.black,
              elevation: 5,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              minimumSize: const Size(200, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Masuk ke Kamar Saya', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Icon(Icons.arrow_forward_rounded, size: 20),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // ===== Quick Access =====
          _quickAccessLogin(),
          const SizedBox(height: 8),
          Row(
            children: [
              // === TOMBOL 1: SIDIK JARI / ID ===
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 219, 209, 206),
                    foregroundColor: Colors.black87,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        16,
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Aksi sidik jari
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.fingerprint_rounded, size: 24),
                      const SizedBox(width: 8),
                      const Text(
                        'Sidik Jari / ID',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),

              // 👇 Jarak pemisah horizontal antar kedua tombol
              const SizedBox(width: 16),

              // === TOMBOL 2: KODE OTP WA ===
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 219, 209, 206),
                    foregroundColor: Colors.black87,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    // Aksi OTP WA
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.chat_bubble_outline_rounded,
                        size: 20,
                      ), // Atau ganti dengan ikon WA kustom
                      const SizedBox(width: 8),
                      const Text(
                        'Kode OTP WA',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  // ===== Label kecil di atas field =====
  Widget _fieldLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.plusJakartaSans(
        color: AppColors.secondaryGreen,
        fontSize: 12,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.5,
      ),
    );
  }

  // ===== Baris "LUPA SANDI ?" =====
  Widget _forgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // TODO: navigasi ke reset password (context.push)
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: const Size(40, 30),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          'LUPA SANDI ?',
          style: GoogleFonts.plusJakartaSans(
            color: AppColors.secondaryGreen,
            fontSize: 12,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  Widget _rememberSessionRow() {
    return Row(
      children: [
        Checkbox(
          checkColor: AppColors.surface,
          fillColor: WidgetStateProperty.resolveWith<Color?>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.tertiaryTan; // Warna saat dicentang
            }
            return Colors.transparent; // Warna latar belakang saat kosong
          }),
          value: _rememberSession,
          onChanged: (value) =>
              setState(() => _rememberSession = value ?? false),
        ),
        const Expanded(
          child: Text(
            'Simpan sesi di perangkat ini',
            style: TextStyle(fontSize: 13.0),
          ),
        ),
        const Icon(
          Icons.verified_user_sharp,
          color: AppColors.secondaryGreen,
          size: 12,
        ),
        const SizedBox(width: 4),
        const Text(
          'Terenkripsi',
          style: TextStyle(color: AppColors.secondaryGreen),
        ),
      ],
    );
  }
}

Widget _quickAccessLogin() {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.grey,
              thickness: 2.0,
              height: 40.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
          ),
          Text(
            'AKSES CEPAT',
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey,
              thickness: 2.0,
              height: 40.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
          ),
        ],
      ),
    ],
  );
}
