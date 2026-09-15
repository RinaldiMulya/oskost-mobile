import 'package:flutter/material.dart';
// ponytail: POST /api/v1/invoices/:id/snap → webview_flutter load paymentUrl; deep-link oskost://payment-finish
class InvoicePayScreen extends StatelessWidget {
  final String id;
  const InvoicePayScreen({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bayar $id')),
      body: Center(child: Text('TODO: WebView paymentUrl + handle oskost://payment-finish → poll GET /invoices/$id')),
    );
  }
}
