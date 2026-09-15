import 'package:flutter/material.dart';
// ponytail: POST /api/v1/reports + POST /reports/:id/photos (signed URL, webp max 500KB, image_picker+compress)
class ReportNewScreen extends StatelessWidget {
  const ReportNewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lapor Kerusakan')),
      body: const Center(child: Text('TODO: form title+desc + pick/compress foto → upload')),
    );
  }
}
