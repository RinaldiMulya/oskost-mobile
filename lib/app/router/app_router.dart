import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oskost_smartkost/features/auth/presentation/screens/login_screen.dart';
import 'package:oskost_smartkost/features/home/presentation/screens/home_screen.dart';
import 'package:oskost_smartkost/features/home/presentation/screens/login_screen.dart';



final appRouter = GoRouter(
  initialLocation: '/loginOskost',
  routes: [
    // Define your routes here
    
    GoRoute(
      path: '/login',
      builder:(context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/loginOskost',
      builder: (context, state) => const LoginScreen()
    ),
  ],
);