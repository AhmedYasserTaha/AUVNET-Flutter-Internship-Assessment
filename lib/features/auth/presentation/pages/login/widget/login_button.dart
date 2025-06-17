import 'package:e_commerce_app/app/app_fonts.dart';
import 'package:e_commerce_app/app/routes.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Custom widget for the login button, interacts with AuthBloc
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
    // BlocConsumer combines BlocListener and BlocBuilder
    // `listener` is used for side effects like navigation or showing a SnackBar
    // `builder` is used to rebuild a part of the UI based on the Bloc's state
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // If authentication state is successful (AuthSuccess)
        if (state is AuthSuccess) {
          // Navigate to the home screen and remove all previous screens from the stack
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.homeRoute,
            (route) => false,
          );
          // Show a login success message
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Login Success")));
        } else if (state is AuthFailure) {
          // If authentication fails (AuthFailure), show an error message
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        // If authentication is in progress (AuthLoading), show a loading indicator
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        // Display the login button
        return CustomPrimaryButton(
          text: "Login",
          style: AppFonts.font14MediumwhiteColor,
          onPressed: () {
            // When the button is pressed, send a SignInRequested event to AuthBloc
            // passing the email and password from the controllers
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
