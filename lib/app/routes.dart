import 'package:e_commerce_app/features/onbording/onboarding_page.dart';
import 'package:e_commerce_app/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashRoute = '/';
  static const String onboardingRoute = '/onboarding';
  // Add other routes here
  // static const String loginRoute = '/login';
  // static const String homeRoute = '/home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      // Add cases for other routes
      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('Route not found!'))),
        );
    }
  }
}
