import 'package:e_commerce_app/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:e_commerce_app/features/auth/presentation/pages/sign_up/widget/sign_up_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/core/di/injection.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use BlocProvider to provide an instance of AuthBloc to SignUpPageBody and its descendant widgets
      // This allows SignUpPageBody to access AuthBloc to send events and listen to states
      body: BlocProvider<AuthBloc>(
        // `sl<AuthBloc>()` assumes you are using get_it for Dependency Injection
        // It creates or fetches a registered instance of AuthBloc
        create: (_) => sl<AuthBloc>(),
        child: const SignUpPageBody(),
      ),
    );
  }
}
