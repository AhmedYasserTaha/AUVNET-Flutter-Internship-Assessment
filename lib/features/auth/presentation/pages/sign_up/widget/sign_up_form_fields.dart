import 'package:e_commerce_app/core/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignUpFormFields extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController confirmPassword;

  const SignUpFormFields({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: email,
          hintText: "email",
          icon: Icons.email_outlined,
          validator: (value) {
            if (value == null || value.isEmpty)
              return 'Please enter your email';
            if (!value.contains('@')) return 'Please enter a valid email';
            return null;
          },
        ),
        const Gap(20),
        CustomTextFormField(
          controller: password,
          hintText: "password",
          icon: Icons.lock,
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty)
              return 'Please enter your password';
            if (value.length < 6)
              return 'Password must be at least 6 characters';
            return null;
          },
        ),
        const Gap(20),
        CustomTextFormField(
          controller: confirmPassword,
          hintText: "confirm password",
          icon: Icons.lock,
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty)
              return 'Please confirm your password';
            if (value != password.text) return "Passwords do not match";
            return null;
          },
        ),
      ],
    );
  }
}
