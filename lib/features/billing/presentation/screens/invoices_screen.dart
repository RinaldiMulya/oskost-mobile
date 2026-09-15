import 'package:flutter/material.dart';
// ponytail: GET /api/v1/invoices?page&status; filter UNPAID/PAID/OVERDUE
class InvoicesScreen extends StatelessWidget {
  const InvoicesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tagihan')),
      body: const Center(child: Text('TODO: list invoices + filter status + tap → /invoices/:id')),
    );
  }
}
