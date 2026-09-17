import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oskost_smartkost/training/storage/prefs_helper.dart';

// Training home - halaman setelah login sukses
// ponytail: dummy home untuk latihan; base app pakai /home real
class TrainingHomeScreen extends StatelessWidget {
  const TrainingHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Training Home')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, size: 80, color: Colors.green),
              const SizedBox(height: 16),
              const Text('Login Berhasil!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Kamu masuk via Training Login (dummy)', textAlign: TextAlign.center),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () async {
                  final v = await TrainingPrefs.getLogin();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('isLoggedIn: $v')));
                  }
                },
                icon: const Icon(Icons.visibility),
                label: const Text('Cek prefs (get)'),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                onPressed: () async {
                  await TrainingPrefs.clear(); // remove
                  if (context.mounted) context.go('/training/login');
                },
                icon: const Icon(Icons.logout),
                label: const Text('Logout (remove prefs)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
