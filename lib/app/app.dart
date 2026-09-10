import 'package:flutter/material.dart';
import 'package:oskost_smartkost/app/router/app_router.dart';

class OsKostApp extends StatelessWidget {
  const OsKostApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'OsKost',
      routerConfig: appRouter,
    );
  }
}