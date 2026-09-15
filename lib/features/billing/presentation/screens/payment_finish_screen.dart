import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// ponytail: deep-link oskost://payment-finish?status=success|pending|failed → poll GET /invoices/:id
class PaymentFinishScreen extends StatelessWidget {
  const PaymentFinishScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final status = GoRouterState.of(context).uri.queryParameters['status'];
    return Scaffold(
      appBar: AppBar(title: const Text('Pembayaran')),
      body: Center(child: Text('TODO: status=$status → refresh invoice → tampilkan PAID/PENDING')),
    );
  }
}
