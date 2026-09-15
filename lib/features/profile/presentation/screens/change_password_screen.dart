import 'package:flutter/material.dart';
// ponytail: POST /api/v1/auth/password + OTP fallback "Lupa password lama?" → /forgot-password
class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ganti Password')),
      body: const Center(child: Text('TODO: oldPassword + newPassword + confirm; link Lupa password lama? → OTP WA')),
    );
  }
}
