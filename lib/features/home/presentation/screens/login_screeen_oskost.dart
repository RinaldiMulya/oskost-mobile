import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
// import 'package: lib/constants/app_colors.dart;

import 'package:oskost_smartkost/constants/app_colors.dart';

class LoginScreeenOskost extends StatefulWidget {
  const LoginScreeenOskost({super.key});

  @override
  State<LoginScreeenOskost> createState() => _LoginScreeenOskostState();
}

class _LoginScreeenOskostState extends State<LoginScreeenOskost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.circle, size: 15, color: AppColors.tertiaryTan),
            SizedBox(width: 2),
            Text('OsKost'),
          ],
        ),
        actions: [
          Icon(Icons.account_circle, size: 40, color: AppColors.tertiaryTan),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Divider(color: AppColors.neutral, thickness: 2.0, height: 1.0),
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _HeroHeader(),
              _WelcomeSection(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _LoginFormCard(),
                    SizedBox(height: 20),
                    _QuickAccessRow(),
                    SizedBox(height: 10),
                    _NewTenantInfoCard(),
                  ],
                ),
              ),
              _FooterVersion(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _HeroHeader() {
  return Stack(
    children: [
      Container(
        height: 200,
        width: double.infinity,

        child: Text("TEST ARCHITECTURE"),
      ),
    ],
  );
}

Widget _WelcomeSection() {
  return Stack(
    children: [
      Container(
        height: 200,
        width: double.infinity,
        child: Text("TEST ARCHITECTURE 2"),
      ),
    ],
  );
}

// ponytail: placeholder Container+Text only, upgrade to real form/card when UI final
Widget _LoginFormCard() {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.all(16),
    color: Colors.grey[200],
    child: const Text("TEST _LoginFormCard"),
  );
}

Widget _QuickAccessRow() {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 16),
    padding: const EdgeInsets.all(16),
    color: Colors.grey[200],
    child: const Text("TEST _QuickAccessRow"),
  );
}

Widget _NewTenantInfoCard() {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.all(16),
    color: Colors.grey[200],
    child: const Text("TEST _NewTenantInfoCard"),
  );
}

Widget _FooterVersion() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: const Text("TEST _FooterVersion", textAlign: TextAlign.center),
  );
}
