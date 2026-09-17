import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oskost_smartkost/app/router/auth_guard.dart';
import 'package:oskost_smartkost/app/router/route_paths.dart';
import 'package:oskost_smartkost/app/shell/app_shell.dart';
import 'package:oskost_smartkost/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:oskost_smartkost/features/auth/presentation/screens/force_reset_screen.dart';
import 'package:oskost_smartkost/features/auth/presentation/screens/login_screen.dart';
import 'package:oskost_smartkost/features/billing/presentation/screens/invoice_detail_screen.dart';
import 'package:oskost_smartkost/features/billing/presentation/screens/invoice_pay_screen.dart';
import 'package:oskost_smartkost/features/billing/presentation/screens/invoices_screen.dart';
import 'package:oskost_smartkost/features/billing/presentation/screens/payment_finish_screen.dart';
import 'package:oskost_smartkost/features/home/presentation/screens/home_screen.dart';
import 'package:oskost_smartkost/features/home/presentation/screens/notifications_screen.dart';
import 'package:oskost_smartkost/features/profile/presentation/screens/change_password_screen.dart';
import 'package:oskost_smartkost/features/profile/presentation/screens/profile_screen.dart';
import 'package:oskost_smartkost/features/report/presentation/screens/report_detail_screen.dart';
import 'package:oskost_smartkost/features/report/presentation/screens/report_new_screen.dart';
import 'package:oskost_smartkost/features/report/presentation/screens/reports_screen.dart';
import 'package:oskost_smartkost/training/storage/login_training_screen.dart';
import 'package:oskost_smartkost/training/storage/splash_screen.dart';
import 'package:oskost_smartkost/training/storage/training_home_screen.dart';

// ponytail: MVP router only; add /admin/* when Web 2.0 admin needed. Guard is in-memory now, swap to secure_storage+JWT later.
final appRouter = GoRouter(
  initialLocation: RoutePaths.login, // buka app langsung ke login
  refreshListenable: authGuard, // kalau satpam teriak "status berubah!", router cek ulang
  debugLogDiagnostics: true,
  redirect: (context, state) {

    final loc = state.uri.toString();
    final loggedIn = authGuard.isLoggedIn;
    final forceReset = authGuard.forceReset;

    final isLogin = loc == RoutePaths.login || loc == RoutePaths.loginAlias || loc == '/';
    final isForgot = loc == RoutePaths.forgotPassword;
    final isForceReset = loc == RoutePaths.forceReset;
    final isPaymentFinish = loc.startsWith(RoutePaths.paymentFinish);
    final isTraining = loc.startsWith('/training');

    // training routes always allowed (for learning)
    if (isTraining) return null;

    // allow payment deep-link even when logged out (Midtrans redirect)
    if (isPaymentFinish) return null;

    // force-reset takes precedence
    if (loggedIn && forceReset && !isForceReset) return RoutePaths.forceReset;
    if (isForceReset && !loggedIn) return RoutePaths.login;

    // public routes
    if (isLogin || isForgot || isForceReset) {
      if (loggedIn && !forceReset && isLogin) return RoutePaths.home;
      return null;
    }

    // protected: must login
    if (!loggedIn) return RoutePaths.login;
    return null;
  },
  
  routes: [
    GoRoute(
      path: RoutePaths.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RoutePaths.loginAlias,
      redirect: (context, state) => RoutePaths.login,
    ),
    GoRoute(
      path: RoutePaths.forgotPassword,
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: RoutePaths.forceReset,
      builder: (context, state) => const ForceResetScreen(),
    ),
    GoRoute(
      path: RoutePaths.paymentFinish,
      builder: (context, state) => const PaymentFinishScreen(),
    ),
    // keep "/" compat
    GoRoute(
      path: '/',
      redirect: (context, state) => RoutePaths.home,
    ),

    // --- authenticated shell (bottom nav) ---
    ShellRoute(
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(
          path: RoutePaths.home,
          builder: (context, state) {
            final q = state.uri.queryParameters['count'];
            final count = int.tryParse(q ?? '') ?? 10; // ponytail: dummy 12; ganti ke real data saat API siap
            return HomePage(count: count);
          },
        ),
        GoRoute(
          path: RoutePaths.invoices,
          builder: (context, state) => const InvoicesScreen(),
        ),
        GoRoute(
          path: RoutePaths.reports,
          builder: (context, state) => const ReportsScreen(),
        ),
        GoRoute(
          path: RoutePaths.profile,
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),

    // --- detail / stack routes (outside shell, with back) ---
    GoRoute(
      path: '/invoices/:id/pay',
      builder: (context, state) => InvoicePayScreen(id: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/invoices/:id',
      builder: (context, state) => InvoiceDetailScreen(id: state.pathParameters['id']!),
    ),
    GoRoute(
      path: RoutePaths.reportNew,
      builder: (context, state) => const ReportNewScreen(),
    ),
    GoRoute(
      path: '/reports/:id',
      builder: (context, state) => ReportDetailScreen(id: state.pathParameters['id']!),
    ),
    GoRoute(
      path: RoutePaths.changePassword,
      builder: (context, state) => const ChangePasswordScreen(),
    ),
    GoRoute(
      path: RoutePaths.notifications,
      builder: (context, state) => const NotificationsScreen(),
    ),

    // --- training (isolated, not guarded) ---
    GoRoute(
      path: '/training/splash',
      builder: (context, state) => const TrainingSplashScreen(),
    ),
    GoRoute(
      path: '/training/login',
      builder: (context, state) => const LoginTrainingScreen(),
    ),
    GoRoute(
      path: '/training/home',
      builder: (context, state) => const TrainingHomeScreen(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text('OsKost')),
    body: Center(child: Text('Halaman tidak ditemukan: ${state.uri}')),
  ),
);