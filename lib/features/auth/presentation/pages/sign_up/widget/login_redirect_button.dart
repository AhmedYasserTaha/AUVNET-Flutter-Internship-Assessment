import 'package:e_commerce_app/app/app_fonts.dart';
import 'package:e_commerce_app/app/routes.dart';
import 'package:e_commerce_app/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginRedirectButton extends StatelessWidget {
  const LoginRedirectButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final isLoading = state is AuthLoading;
        return TextButton(
          onPressed:
              isLoading
                  ? null
                  : () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.loginRoute,
                      (route) => false,
                    );
                  },
          child: Text("Already have an account?", style: AppFonts.font14Bold),
        );
      },
    );
  }
}
