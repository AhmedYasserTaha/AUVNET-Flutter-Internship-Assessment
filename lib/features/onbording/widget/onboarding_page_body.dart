import 'package:e_commerce_app/app/app_colors.dart';
import 'package:e_commerce_app/app/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnboardingPageBody extends StatelessWidget {
  const OnboardingPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: Column(
            children: [
              Image.asset("assets/icon/nawel.png", height: 335, width: 335),
              Gap(85),
              Text("all-in-one delivery ", style: AppFonts.font28Medium),
              Gap(10),
              Text(
                "Order groceries, medicines and meals\ndelivered straight to your door ",
                textAlign: TextAlign.center,
                style: AppFonts.font14light,
              ),
              Gap(50),
            ],
          ),
        ),
      ],
    );
  }
}
