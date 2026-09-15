import 'package:flutter/material.dart';
// ponytail: OTP via WA Baileys + rate-limit 60s; wire to POST /api/v1/auth/otp/send
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lupa Password')),
      body: const Center(child: Text('TODO: input phone/email → kirim OTP WA → verifikasi → atur password baru')),
    );
  }
}
