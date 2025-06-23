import 'package:e_commerce_app/features/auth/presentation/pages/login/login_page.dart';
import 'package:e_commerce_app/features/auth/presentation/pages/sign_up/sign_up_page.dart';
import 'package:e_commerce_app/features/home/presentation/home_layout.dart';
import 'package:e_commerce_app/features/home/presentation/home_page_arguments.dart';
import 'package:e_commerce_app/features/onbording/onboarding_page.dart';
import 'package:e_commerce_app/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String signUpRoute = '/signUp';
  static const String homeRoute = '/home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case homeRoute:
        // Extract the name argument from settings
        final args = settings.arguments as HomePageArguments?;

        return MaterialPageRoute(builder: (_) => HomeLayout(args: args));

      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('Route not found!'))),
        );
    }
  }
}
