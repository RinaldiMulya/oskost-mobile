import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oskost_smartkost/constants/app_colors.dart';
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
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
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
          value: _rememberSession,
          onChanged: (value) =>
              setState(() => _rememberSession = value ?? false),
        ),
        const Expanded(
          child: Text(
            'Simpan sesi di perangkat ini',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        const Icon(Icons.verified_user_sharp, color: AppColors.secondaryGreen, size: 12),
        const SizedBox(width: 4),
        const Text('Terenkripsi', style: TextStyle(color: AppColors.secondaryGreen)),
      ],
    );
  }
}
