import 'package:flutter/material.dart';
// ponytail: GET /api/v1/invoices/:id; tampilkan rentAmount+tenantAdminFee-discount = grossAmount
class InvoiceDetailScreen extends StatelessWidget {
  final String id;
  const InvoiceDetailScreen({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Tagihan $id')),
      body: Center(child: Text('TODO: detail $id → tombol Bayar → /invoices/$id/pay (POST /snap)')),
    );
  }
}
