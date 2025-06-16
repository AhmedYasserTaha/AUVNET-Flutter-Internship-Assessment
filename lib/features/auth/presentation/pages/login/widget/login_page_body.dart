import 'package:e_commerce_app/app/app_fonts.dart';
import 'package:e_commerce_app/app/routes.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:e_commerce_app/features/auth/presentation/bloc/bloc/auth_bloc.dart';

class LoginPageBody extends StatelessWidget {
  final email = TextEditingController();
  final password = TextEditingController();
  LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        child: Column(
          children: [
            Image.asset("assets/icon/nawel.png"),
            Gap(10),

            CustomTextFormField(
              hintText: "email",
              controller: email,
              icon: Icons.email_outlined,
            ),
            Gap(20),

            CustomTextFormField(
              controller: password,
              hintText: "password",
              icon: Icons.lock,
              obscureText: true,
            ),
            Gap(26),

            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.homeRoute,
                    (route) => false,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Login Success")),
                  );
                } else if (state is AuthFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CustomPrimaryButton(
                  text: "Login",
                  style: AppFonts.font14MediumwhiteColor,
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      SignInRequested(
                        email: email.text.trim(),
                        password: password.text.trim(),
                      ),
                    );
                  },
                );
              },
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
