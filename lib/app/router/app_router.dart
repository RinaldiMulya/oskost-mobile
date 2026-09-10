import 'package:go_router/go_router.dart';
import 'package:oskost_smartkost/features/home/presentation/screens/home_screen.dart';
import 'package:oskost_smartkost/features/home/presentation/screens/login_screen.dart';
// import 'package:oskost_smartkost/page/login_screen.dart';


final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    // Define your routes here
    GoRoute(
      path: '/login',
      builder:(context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    )
  ],
);