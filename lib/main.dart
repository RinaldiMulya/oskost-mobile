import 'package:flutter/material.dart';
import 'package:oskost_smartkost/app/app.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  runApp(const OsKostApp());
}