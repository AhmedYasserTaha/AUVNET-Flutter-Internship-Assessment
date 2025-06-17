import 'package:e_commerce_app/app/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ShortcutsGrid extends StatelessWidget {
  const ShortcutsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> services = [
      {'icon': 'assets/icon/past.svg', 'label': 'Past \norders'},
      {'icon': 'assets/icon/Security.svg', 'label': 'Super\nSaver'},
      {'icon': 'assets/icon/star.svg', 'label': 'Must-tries'},
      {'icon': 'assets/icon/give.svg', 'label': 'Give Back'},
      {'icon': 'assets/icon/bestSeller.svg', 'label': 'Best\nSellers'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      itemCount: services.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.50, // علشان ندي مساحة للاسم تحت
      ),
      itemBuilder: (context, index) {
        final service = services[index];
        return Column(
          children: [
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                color: const Color(0xFFFFEEE6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: SvgPicture.asset(
                  service['icon']!,
                  width: 30,
                  height: 30,
                ),
              ),
            ),
            Gap(10),
            Text(
              service['label']!,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppFonts.font12MediumblackColor,
            ),
          ],
        );
      },
    );
  }
}
