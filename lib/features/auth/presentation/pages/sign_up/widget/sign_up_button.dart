import 'package:e_commerce_app/app/app_fonts.dart';
import 'package:e_commerce_app/app/routes.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController email;
  final TextEditingController password;

  const SignUpButton({
    required this.formKey,
    required this.email,
    required this.password,
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
          ).showSnackBar(const SnackBar(content: Text("Sign up Success!")));
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
          text: "Sign up",
          style: AppFonts.font14MediumwhiteColor,
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              context.read<AuthBloc>().add(
                SignUpRequested(
                  email: email.text.trim(),
                  password: password.text.trim(),
                ),
              );
            }
          },
        );
      },
    );
  }
}
