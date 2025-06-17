import 'package:e_commerce_app/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppFonts {
  static TextStyle font28Medium = GoogleFonts.rubik(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    color: AppColors.color333333,
  );
  static TextStyle font18Medium = GoogleFonts.rubik(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
  static TextStyle font14MediumwhiteColor = GoogleFonts.rubik(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );

  static TextStyle font14light = GoogleFonts.mulish(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.blackColor.withOpacity(0.5),
  );
  static TextStyle font14Mediumblack33Color = GoogleFonts.rubik(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.color333333,
  );
  static TextStyle font14Regular = GoogleFonts.rubik(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.color677294,
  );
  static TextStyle font14Bold = GoogleFonts.rubik(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.blueColor,
  );
  static TextStyle font12Bold = GoogleFonts.dmSans(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
  );
  static TextStyle font12Medium = GoogleFonts.dmSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
  static TextStyle font12MediumblackColor = GoogleFonts.dmSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
  static TextStyle font10Medium = GoogleFonts.dmSans(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(.5),
  );
  static TextStyle font16Bold = GoogleFonts.dmSans(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
  );
  static TextStyle font30Bold = GoogleFonts.rubik(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: AppColors.whiteColor,
  );
  static TextStyle font20Bold = GoogleFonts.dmSans(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
  );
}
