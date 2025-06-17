import 'package:e_commerce_app/app/app_fonts.dart';
import 'package:e_commerce_app/app/routes.dart';
import 'package:e_commerce_app/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Widget for the "Create an account" button that directs the user to the sign-up page
class SignUpRedirectButton extends StatelessWidget {
  const SignUpRedirectButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Use BlocBuilder to listen to the AuthBloc state
    // The goal here is to disable the button if an authentication process is in progress (AuthLoading)
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        // Check if the current state is AuthLoading
        final isLoading = state is AuthLoading;
        return TextButton(
          onPressed:
              isLoading
                  ? null // Disable the button if isLoading is true
                  : () {
                    // Direct the user to the sign-up page (signUpRoute)
                    Navigator.pushNamed(context, AppRoutes.signUpRoute);
                  },
          child: Text("Create an account", style: AppFonts.font14Bold),
        );
      },
    );
  }
}
