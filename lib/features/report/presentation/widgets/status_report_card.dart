import 'package:flutter/material.dart';

class StatusReportCard extends StatelessWidget {
  final int countActive;
  final int countDone;
  const StatusReportCard({super.key, this.countActive = 1, this.countDone = 16});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            elevation: 4,
            margin: EdgeInsets.zero,
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                title: const Text('Laporan Aktif', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('$countActive dalam antrean'),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Card(
            elevation: 4,
            margin: EdgeInsets.zero,
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                title: const Text('Terselesaikan', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('$countDone Bulan ini'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
