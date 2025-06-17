import 'package:e_commerce_app/core/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// Custom widget to display email and password input fields on the login page
class LoginFormFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginFormFields({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Email input field
        CustomTextFormField(
          hintText: "email",
          controller: emailController,
          icon: Icons.email_outlined,
        ),
        // Password input field
        const Gap(20),
        CustomTextFormField(
          controller: passwordController,
          hintText: "password",
          icon: Icons.lock,
          obscureText: true,
        ),
      ],
    );
  }
}
