import 'package:e_commerce_app/app/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class GetCodeWidget extends StatelessWidget {
  const GetCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // لون الشادو
              blurRadius: 10, // درجة النعومة
              offset: Offset(0, 4), // الاتجاه العمودي للشادو
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              SvgPicture.asset("assets/icon/Security.svg"),
              Gap(5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Got a code !",
                    style: AppFonts.font14Mediumblack33Color,
                  ),
                  Text(
                    "Add your code and save on your\norder !",
                    style: AppFonts.font10Medium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
