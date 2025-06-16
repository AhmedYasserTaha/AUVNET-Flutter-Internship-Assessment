import 'package:e_commerce_app/app/app_fonts.dart';
import 'package:e_commerce_app/app/routes.dart';
import 'package:e_commerce_app/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpRedirectButton extends StatelessWidget {
  const SignUpRedirectButton({super.key});

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
                    Navigator.pushNamed(context, AppRoutes.signUpRoute);
                  },
          child: Text("Create an account", style: AppFonts.font14Bold),
        );
      },
    );
  }
}
