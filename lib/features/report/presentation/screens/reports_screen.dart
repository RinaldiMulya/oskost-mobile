import 'package:flutter/material.dart';
// ponytail: GET /api/v1/reports?page&status
class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Laporan Kerusakan')),
      body: const Center(child: Text('TODO: list reports + FAB → /reports/new')),
    );
  }
}
