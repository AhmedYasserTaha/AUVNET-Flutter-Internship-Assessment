import 'package:flutter/material.dart';
import 'package:e_commerce_app/app/app_fonts.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final TextStyle? style;
  final Color? color; // اللون قابل للتعديل

  const CustomPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.color,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? const Color(0xFF8900FE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(text, style: style ?? AppFonts.font18Medium),
      ),
    );
  }
}
