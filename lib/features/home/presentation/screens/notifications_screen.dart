import 'package:flutter/material.dart';
// ponytail: GET /api/v1/notifications; mark read; push via FCM channel tagihan/pengumuman
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifikasi')),
      body: const Center(child: Text('TODO: list notifikasi + isRead + tap → deep link')),
    );
  }
}
