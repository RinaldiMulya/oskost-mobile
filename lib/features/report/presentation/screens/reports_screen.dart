import 'package:flutter/material.dart';
import 'package:oskost_smartkost/features/report/presentation/widgets/room_info_card.dart';
import 'package:oskost_smartkost/features/report/presentation/widgets/status_report_card.dart';
// ponytail: GET /api/v1/reports?page&status
class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            StatusReportCard(),
            SizedBox(height: 10),
            RoomInfoCard(),
          ],
        ),
      ),
    );
  }
}
