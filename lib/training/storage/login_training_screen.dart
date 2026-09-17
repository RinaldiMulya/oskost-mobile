import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oskost_smartkost/training/storage/prefs_helper.dart';

// Training login - prefs langsung di button seperti di pelatihan
// ponytail: latihan saja; base app pakai authGuard.login()
class LoginTrainingScreen extends StatefulWidget {
  const LoginTrainingScreen({super.key});

  @override
  State<LoginTrainingScreen> createState() => _LoginTrainingScreenState();
}

class _LoginTrainingScreenState extends State<LoginTrainingScreen> {
  final _email = TextEditingController();
  final _pass = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_email.text.isEmpty || _pass.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Isi email & password (dummy, bebas)')));
      return;
    }
    await TrainingPrefs.setLogin(true); // set
    if (mounted) context.go('/training/splash');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Training Login')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Cara pelatihan: prefs di button', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Isi bebas (dummy), klik Login -> Splash 3s -> Home', style: TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 24),
            TextField(
              controller: _email,
              decoration: const InputDecoration(labelText: 'Email (dummy)', border: OutlineInputBorder(), prefixIcon: Icon(Icons.email)),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _pass,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password (dummy)', border: OutlineInputBorder(), prefixIcon: Icon(Icons.lock)),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _login,
                child: const Text('Login (set prefs) -> Splash'),
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () async {
                final v = await TrainingPrefs.getLogin();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('isLoggedIn: $v')));
                }
              },
              child: const Text('Cek prefs (get)'),
            ),
          ],
        ),
      ),
    );
  }
}
