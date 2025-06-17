import 'package:e_commerce_app/core/di/injection.dart';
import 'package:e_commerce_app/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:e_commerce_app/features/auth/presentation/pages/login/widget/login_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use BlocProvider to provide an instance of AuthBloc to LoginPageBody and its descendant widgets
      // This allows LoginPageBody to access AuthBloc to send events and listen to states
      body: BlocProvider<AuthBloc>(
        // `sl<AuthBloc>()` assumes you are using get_it for Dependency Injection
        // It creates or fetches a registered instance of AuthBloc
        create: (_) => sl<AuthBloc>(),
        child: const LoginPageBody(),
      ),
    );
  }
}
