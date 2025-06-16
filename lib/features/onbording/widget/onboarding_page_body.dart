import 'dart:ui';

import 'package:e_commerce_app/app/app_colors.dart';
import 'package:e_commerce_app/app/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnboardingPageBody extends StatefulWidget {
  const OnboardingPageBody({super.key});

  @override
  State<OnboardingPageBody> createState() => _OnboardingPageBodyState();
}

class _OnboardingPageBodyState extends State<OnboardingPageBody> {
  int currentIndex = 0;

  final List<String> titles = [
    "all-in-one delivery",
    "User-to-User Delivery",
    "Sales & Discounts",
  ];

  final List<String> subtitles = [
    "Order groceries, medicines and meals\ndelivered straight to your door",
    "Send or receive items from other users quickly\nand easily",
    "Discover exclusive sales and deals every day",
  ];

  void _nextText() {
    setState(() {
      if (currentIndex < titles.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0; // يرجع لأول واحدة لو وصلت للآخر
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // الدائرة العلوية
        Positioned(
          top: -5,
          left: -100,
          child: Container(
            width: 340,
            height: 340,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [AppColors.primaryButtonColor, AppColors.orangeColor],
              ),
            ),
          ),
        ),
        // دائرة متلاشية سفلية
        Positioned(
          bottom: -100,
          right: -100,
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.teal.withOpacity(0.35),
                      const Color.fromARGB(0, 255, 255, 255),
                    ],
                    stops: const [0.15, 0.7],
                    radius: 0.7,
                    center: Alignment.center,
                  ),
                ),
              ),
            ),
          ),
        ),
        // المحتوى
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
            child: Column(
              children: [
                Image.asset("assets/icon/nawel.png", height: 335, width: 335),
                Gap(85),
                Text(titles[currentIndex], style: AppFonts.font28Medium),
                Gap(10),
                Text(
                  subtitles[currentIndex],
                  textAlign: TextAlign.center,
                  style: AppFonts.font14light,
                ),
                Gap(50),

                // زرار Get Started
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      // action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8900FE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text("Get Started", style: AppFonts.font18Medium),
                  ),
                ),

                Gap(20),

                // زرار Next
                TextButton(
                  onPressed: _nextText,
                  child: Text(
                    "Next",
                    style: AppFonts.font14Regular.copyWith(
                      color: Color(0xFF677294),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
