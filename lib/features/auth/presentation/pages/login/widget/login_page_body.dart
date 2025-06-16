import 'package:e_commerce_app/app/app_fonts.dart';
import 'package:e_commerce_app/app/routes.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        child: Column(
          children: [
            Image.asset("assets/icon/nawel.png"),
            Gap(10),

            CustomTextFormField(hintText: "email", icon: Icons.email_outlined),
            Gap(20),

            CustomTextFormField(
              hintText: "password",
              icon: Icons.lock,
              obscureText: true,
            ),
            Gap(26),
            CustomPrimaryButton(
              text: "Login",
              style: AppFonts.font14MediumwhiteColor,
              onPressed: () {},
            ),
            Gap(20),

            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.signUpRoute);
              },
              child: Text("Create an account", style: AppFonts.font14Bold),
            ),
          ],
        ),
      ),
    );
  }
}
