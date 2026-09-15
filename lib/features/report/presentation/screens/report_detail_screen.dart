import 'package:flutter/material.dart';
// ponytail: GET /api/v1/reports/:id
class ReportDetailScreen extends StatelessWidget {
  final String id;
  const ReportDetailScreen({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Laporan $id')),
      body: Center(child: Text('TODO: detail $id status OPEN/IN_PROGRESS/RESOLVED')),
    );
  }
}
