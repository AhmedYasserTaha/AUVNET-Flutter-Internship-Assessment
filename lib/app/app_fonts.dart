import 'package:e_commerce_app/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppFonts {
  static TextStyle font28Medium = GoogleFonts.rubik(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    color: AppColors.black33Color,
  );
  static TextStyle font18Medium = GoogleFonts.rubik(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );

  static TextStyle font14light = GoogleFonts.mulish(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.blackColor.withOpacity(0.5),
  );
  static TextStyle font14Medium = GoogleFonts.rubik(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.black33Color,
  );
  static TextStyle font14Regular = GoogleFonts.rubik(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
  );
}
