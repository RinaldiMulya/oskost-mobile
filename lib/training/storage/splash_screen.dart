import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oskost_smartkost/training/storage/prefs_helper.dart';

// Training splash - delay 3 detik seperti di pelatihan
// ponytail: delay fix 3s untuk latihan; base app pakai await di main() tanpa delay
class TrainingSplashScreen extends StatefulWidget {
  const TrainingSplashScreen({super.key});

  @override
  State<TrainingSplashScreen> createState() => _TrainingSplashScreenState();
}

class _TrainingSplashScreenState extends State<TrainingSplashScreen> {
  @override
  void initState() {
    super.initState();
    _check();
  }

  Future<void> _check() async {
    await Future.delayed(const Duration(seconds: 3)); // branding delay ala pelatihan
    final logged = await TrainingPrefs.getLogin();
    if (!mounted) return;
    if (logged) {
      context.go('/training/home');
    } else {
      context.go('/training/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('OsKost', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            CircularProgressIndicator(),
            SizedBox(height: 8),
            Text('Training Splash 3s...'),
          ],
        ),
      ),
    );
  }
}
