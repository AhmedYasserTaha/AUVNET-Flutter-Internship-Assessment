import 'package:e_commerce_app/app/app_fonts.dart';
import 'package:e_commerce_app/app/routes.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_feild.dart';
import 'package:e_commerce_app/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // BLoC import
import 'package:gap/gap.dart';
// import 'package:supabase_flutter/supabase_flutter.dart'; // Supabase calls will be in Data layer

// Assuming you have an AuthBloc, AuthEvent, and AuthState defined like this:
// import 'package:e_commerce_app/features/auth/presentation/bloc/auth_bloc.dart';
// import 'package:e_commerce_app/features/auth/presentation/bloc/auth_event.dart';
// import 'package:e_commerce_app/features/auth/presentation/bloc/auth_state.dart';

class SignUpPageBody extends StatefulWidget {
  const SignUpPageBody({super.key});

  @override
  State<SignUpPageBody> createState() => _SignUpPageBodyState();
}

class _SignUpPageBodyState extends State<SignUpPageBody> {
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // For form validation

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        child: Column(
          children: [
            Image.asset("assets/icon/nawel.png"),
            const Gap(10),
            Form(
              // Wrap with Form for validation
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: email,
                    hintText: "email",
                    icon: Icons.email_outlined,
                    // validator: (value) { ... } // Add email validation if needed
                  ),
                  const Gap(20),
                  CustomTextFormField(
                    controller: password,
                    hintText: "password",
                    icon: Icons.lock,
                    obscureText: true,
                    // validator: (value) { ... } // Add password validation if needed
                  ),
                  const Gap(20),
                  CustomTextFormField(
                    controller: confirmPassword,
                    hintText: "confirm password",
                    icon: Icons.lock,
                    obscureText: true,
                    validator: (value) {
                      if (value != password.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const Gap(26),
            BlocConsumer<AuthBloc, AuthState>(
              // Ensure AuthBloc and AuthState are your actual BLoC classes
              listener: (context, state) {
                if (state is AuthSuccess) {
                  // Your success state
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.homeRoute,
                    (route) => false,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Sign up Successful!")),
                  );
                } else if (state is AuthFailure) {
                  // Your failure state
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  ); // Assuming AuthFailure has a message
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  // Your loading state
                  return const Center(child: CircularProgressIndicator());
                }
                return CustomPrimaryButton(
                  text: "Sign up",
                  style: AppFonts.font14MediumwhiteColor,
                  onPressed: () {
                    // Validate the form first
                    if (_formKey.currentState?.validate() ?? false) {
                      // The validator for confirmPassword already checks if passwords match.
                      // Dispatch event to BLoC
                      // Ensure SignUpRequested is your actual event
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
            ),
            const Gap(20),
            BlocBuilder<AuthBloc, AuthState>(
              // To disable the "Create an account" button during loading
              builder: (context, state) {
                final isLoading = state is AuthLoading; // Your loading state
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
                  child: Text("Create an account", style: AppFonts.font14Bold),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder for BLoC classes - these should be defined in their respective files
// abstract class AuthEvent {}

// class SignUpRequested extends AuthEvent {
//   final String email;
//   final String password;
//   SignUpRequested({required this.email, required this.password});
// }

// abstract class AuthState {}

// class AuthInitial extends AuthState {}

// class AuthLoading extends AuthState {}

// class AuthSuccess extends AuthState {
//   // final User user; // Optionally, pass user data upon success
//   // AuthSuccess(this.user);
// }

// class AuthFailure extends AuthState {
//   final String message;
//   AuthFailure(this.message);
// }

// // This is a placeholder AuthBloc.
// // You should have your actual AuthBloc implemented, likely injecting UseCases.
// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   AuthBloc() : super(AuthInitial()) {
//     on<SignUpRequested>((event, emit) async {
//       emit(AuthLoading());
//       try {
//         // TODO: Replace this with a call to your actual SignUpUseCase
//         // For example:
//         // final user = await signUpUseCase.call(Params(email: event.email, password: event.password));
//         // emit(AuthSuccess(user));

//         // Simulate network call for demonstration
//         await Future.delayed(
//           const Duration(seconds: 2),
//         ); // Simulate network call
//         // Simulate success/failure based on basic email check for now
//         if (event.email.isNotEmpty && event.email.contains('@')) {
//           emit(AuthSuccess());
//         } else {
//           emit(AuthFailure("Simulated sign up error: Invalid email"));
//         }
//       } catch (e) {
//         emit(AuthFailure(e.toString()));
//       }
//     });
//   }
// }
