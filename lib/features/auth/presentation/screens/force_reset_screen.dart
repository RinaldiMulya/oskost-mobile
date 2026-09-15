import 'package:flutter/material.dart';
// ponytail: paksa ganti password setelah admin reset (forcePasswordReset=true); wire to POST /api/v1/auth/password
class ForceResetScreen extends StatelessWidget {
  const ForceResetScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ganti Password Wajib')),
      body: const Center(child: Text('TODO: form password baru → simpan → clear forceReset → go /home')),
    );
  }
}
