import 'package:e_commerce_app/app/app_colors.dart';
import 'package:e_commerce_app/app/app_fonts.dart';
import 'package:e_commerce_app/features/home/presentation/widget/bset_order_widget.dart';
import 'package:e_commerce_app/features/home/presentation/widget/get_code_widget.dart';
import 'package:e_commerce_app/features/home/presentation/widget/popular_widget.dart';
import 'package:e_commerce_app/features/home/presentation/widget/services_widget.dart';
import 'package:e_commerce_app/features/home/presentation/widget/shortcuts_grid.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔶 Header
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.primaryButtonColor, AppColors.orangeColor],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 🔸 User Info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Delivering to", style: AppFonts.font12Bold),
                        Text(
                          "Al Satwa, 81A Street",
                          style: AppFonts.font16Bold,
                        ),
                        Text("Hi hepa! ", style: AppFonts.font30Bold),
                      ],
                    ),
                    // 🔸 Profile Image
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage("assets/image/photo.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Gap(12),

            // 🔶 Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Services:', style: AppFonts.font20Bold),
            ),

            const Gap(20),

            // 🔶 Services Widget (List from Supabase)
            const ServicesWidget(),

            const Gap(30),

            GetCodeWidget(),
            const Gap(15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Shortcuts:', style: AppFonts.font20Bold),
            ),
            const Gap(20),
            ShortcutsGrid(),
            const Gap(30),
            BestOrderWidget(),
            const Gap(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Popular restaurants nearby:',
                style: AppFonts.font16Bold,
              ),
            ),
            const Gap(15),

            PopularWidget(),
          ],
        ),
      ),
    );
  }
}
