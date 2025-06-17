import 'package:e_commerce_app/core/widgets/custom_nav_bar.dart';
import 'package:e_commerce_app/features/home/presentation/home_page.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;

  // الصفحات اللي هتتنقل ما بينهم
  final List<Widget> _pages = [
    HomePage(),
    Center(child: Text('Category Page')),
    Center(child: Text('Delivery Page')),
    Center(child: Text('Cart Page')),
    Center(child: Text('Profile Page')),
  ];

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
