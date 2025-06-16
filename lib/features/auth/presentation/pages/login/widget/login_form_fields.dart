import 'package:e_commerce_app/core/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
        CustomTextFormField(
          hintText: "email",
          controller: emailController,
          icon: Icons.email_outlined,
        ),
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
