import 'dart:async';
import 'package:e_commerce_app/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashPageBody extends StatefulWidget {
  const SplashPageBody({super.key});

  @override
  State<SplashPageBody> createState() => _SplashPageBodyState();
}

class _SplashPageBodyState extends State<SplashPageBody> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    // انتظر قليلاً لعرض شاشة البداية
    await Future.delayed(const Duration(seconds: 2));

    // تأكد أن الـ widget ما زال موجودًا قبل محاولة التنقل
    if (!mounted) return;

    final currentUser = Supabase.instance.client.auth.currentUser;

    if (currentUser != null) {
      // المستخدم مسجل دخوله بالفعل
      Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
    } else {
      // المستخدم غير مسجل دخوله
      Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    // واجهة شاشة البداية الخاصة بك
    return Center(
      child: Image.asset("assets/icon/nawel.png"), // مثال: شعار التطبيق
    );
  }
}
