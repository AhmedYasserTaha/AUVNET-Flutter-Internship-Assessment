import 'package:e_commerce_app/features/auth/presentation/pages/login/widget/login_button.dart';
import 'package:e_commerce_app/features/auth/presentation/pages/login/widget/login_form_fields.dart';
import 'package:e_commerce_app/features/auth/presentation/pages/login/widget/sign_up_redirect_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // You can add a GlobalKey<FormState> here if you need form validation
  final _formKey = GlobalKey<FormState>(); // Add if you need form validation

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // Ensure controllers are disposed when the widget is removed from the tree to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Column(
        children: [
          Image.asset("assets/icon/nawel.png"),
          const Gap(10),
          // You can uncomment Form and _formKey if you want to add input validation
          // Form( // Uncomment if you add _formKey and validation
          //   key: _formKey,
          //   child:
          // Custom widget for email and password input fields
          Form(
            key: _formKey,
            child: LoginFormFields(
              emailController: _emailController,
              passwordController: _passwordController,
            ),
          ),
          // ),
          const Gap(26),
          // Custom widget for the login button
          LoginButton(
            formKey: _formKey,
            emailController: _emailController,
            passwordController: _passwordController,
          ),
          const Gap(20),
          // Custom widget for the button to redirect to the create account page
          const SignUpRedirectButton(),
        ],
      ),
    );
  }
}
