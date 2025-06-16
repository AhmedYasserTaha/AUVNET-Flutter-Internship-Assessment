import 'package:e_commerce_app/features/splash/widget/splash_page_body.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: SplashPageBody());
  }
}
