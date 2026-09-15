import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oskost_smartkost/app/router/auth_guard.dart';
import 'package:oskost_smartkost/app/router/route_paths.dart';
// ponytail: GET /api/v1/me; ganti password via OTP WA atau password lama
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('TODO: tampilkan user + tenantProfile + activeLease.room'),
            const SizedBox(height: 16),
            FilledButton(onPressed: () => context.push(RoutePaths.changePassword), child: const Text('Ganti Password')),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                authGuard.logout();
                context.go(RoutePaths.login);
              },
              child: const Text('Logout (clear cache)'),
            ),
          ],
        ),
      ),
    );
  }
}
