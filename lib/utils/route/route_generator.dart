import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/presentation/homepage_screen.dart';
import 'package:inventi_coding_exam/screens/login_screen/presentation/login_screen.dart';
import 'package:inventi_coding_exam/screens/splash_screen/splash_screen.dart';
import 'package:inventi_coding_exam/utils/route/route_constants.dart';

class RouteGenerator {
  static final GoRouter router = GoRouter(
    initialLocation: routeSplash,
    routes: [
      GoRoute(
        path: routeSplash,
        name: routeSplash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: routeLogin,
        name: routeLogin,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: routeHomepage,
        name: routeHomepage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              child: const HomePageScreen(),
              transitionDuration: Duration(seconds: 2),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              });
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('Something went wrong. Please contact customer support.'),
      ),
    ),
  );
}
