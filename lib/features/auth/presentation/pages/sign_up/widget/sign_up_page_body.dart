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
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
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
          Form(
            key: _formKey,
            child: SignUpFormFields(
              email: _email,
              password: _password,
              confirmPassword: _confirmPassword,
            ),
          ),
          const Gap(26),
          SignUpButton(formKey: _formKey, email: _email, password: _password),
          const Gap(20),
          const LoginRedirectButton(),
        ],
      ),
    );
  }
}
