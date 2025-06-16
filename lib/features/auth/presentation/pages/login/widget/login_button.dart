import 'package:e_commerce_app/app/app_fonts.dart';
import 'package:e_commerce_app/app/routes.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.homeRoute,
            (route) => false,
          );
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Login Success")));
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
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
              ),
            );
          },
        );
      },
    );
  }
}
