import 'package:e_commerce_app/features/auth/presentation/pages/sign_up/widget/login_redirect_button.dart';
import 'package:e_commerce_app/features/auth/presentation/pages/sign_up/widget/sign_up_button.dart';
import 'package:e_commerce_app/features/auth/presentation/pages/sign_up/widget/sign_up_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignUpPageBody extends StatefulWidget {
  const SignUpPageBody({super.key});

  @override
  State<SignUpPageBody> createState() => _SignUpPageBodyState();
}

class _SignUpPageBodyState extends State<SignUpPageBody> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _name = TextEditingController();
  // GlobalKey is used to access the Form's state and validate inputs
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    _name.dispose();

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
          // Use Form widget to manage and validate input fields
          Form(
            key: _formKey,
            // Custom widget for email, password, and confirm password input fields
            child: SignUpFormFields(
              name: _name,
              email: _email,
              password: _password,
              confirmPassword: _confirmPassword,
            ),
          ),
          const Gap(26),
          // Custom widget for the create account button, passing the form key and controllers
          SignUpButton(
            formKey: _formKey,
            email: _email,
            password: _password,
            name: _name,
          ),
          const Gap(20),
          // Custom widget for the button to redirect to the login page
          const LoginRedirectButton(),
        ],
      ),
    );
  }
}
