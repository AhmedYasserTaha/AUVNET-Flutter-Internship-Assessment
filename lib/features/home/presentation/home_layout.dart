import 'dart:async';

import 'package:e_commerce_app/core/di/injection.dart';
import 'package:e_commerce_app/core/widgets/custom_nav_bar.dart';
import 'package:e_commerce_app/features/auth/domain/usecases/get_current_user_use_case.dart';
import 'package:e_commerce_app/features/home/presentation/home_page.dart';
import 'package:e_commerce_app/features/home/presentation/home_page_arguments.dart';
import 'package:e_commerce_app/features/profile/presentation/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeLayout extends StatefulWidget {
  final HomePageArguments? args;
  const HomeLayout({super.key, this.args});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;
  late List<Widget> _pages;
  StreamSubscription<AuthState>? _authSubscription;
  String? _userName;
  String? _avatarUrl;

  @override
  void initState() {
    super.initState();
    _setupUserAndPages();
    // ✅ الاستماع لتغييرات بيانات المستخدم
    _authSubscription = Supabase.instance.client.auth.onAuthStateChange.listen((
      data,
    ) {
      if (data.event == AuthChangeEvent.userUpdated) {
        // ✅ إعادة تحميل بيانات المستخدم والصفحات عند حدوث تحديث
        if (mounted) {
          _setupUserAndPages();
        }
      }
    });
  }

  void _setupUserAndPages() {
    final user = sl<GetCurrentUserUseCase>()();
    setState(() {
      _userName = user?.userMetadata?['display_name'];
      _avatarUrl = user?.userMetadata?['avatar_url'];
      _buildPages();
    });
  }

  void _buildPages() {
    _pages = [
      HomePage(
        args: HomePageArguments(userName: _userName, avatarUrl: _avatarUrl),
      ),
      const Center(child: Text('Category Page')),
      const Center(child: Text('Delivery Page')),
      const Center(child: Text('Cart Page')),
      const ProfilePage(),
    ];
  }

  @override
  void dispose() {
    // ✅ إلغاء الاشتراك لتجنب تسريب الذاكرة
    _authSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
