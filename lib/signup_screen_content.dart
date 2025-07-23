import 'package:flutter/material.dart';
import 'package:flutter_application_10/CustomText.dart';
import 'package:flutter_application_10/app_colors.dart';
import 'package:flutter_application_10/app_string.dart';
import 'package:flutter_application_10/login_screen.dart';
import 'package:flutter_application_10/textfield.dart';

class SignUpScreenContent extends StatefulWidget {
  final VoidCallback onSwitchToLogin;

  const SignUpScreenContent({super.key, required this.onSwitchToLogin});

  @override
  State<SignUpScreenContent> createState() => _SignUpScreenContentState();
}

class _SignUpScreenContentState extends State<SignUpScreenContent> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextWidget(
              text: AppStrings.loginScreenWelcomeText,
              fontSize: 24,
              color: AppColors.mainColor,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              label: AppStrings.signUpNameText,
              controller: nameController,
              validator: (value) => value!.isEmpty ? 'Name is required' : null,
            ),
            const SizedBox(height: 12),

            CustomTextField(
              label: AppStrings.signUpEmailText,
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required';
                } else if (!value.contains('@')) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),

            CustomTextField(
              label: AppStrings.signUpPhoneText,
              controller: phoneController,
              validator: (value) =>
                  value!.isEmpty ? 'Phone number is required' : null,
            ),
            const SizedBox(height: 12),

            CustomTextField(
              label: AppStrings.signUpPasswordText,
              controller: passwordController,
              isPassword: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),

            CustomTextField(
              label: AppStrings.signUpConfirmPasswordText,
              controller: confirmPasswordController,
              isPassword: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Confirm password is required';
                } else if (value != passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainColor,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                AppStrings.loginButtonText,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 15),

            GestureDetector(
              onTap: widget.onSwitchToLogin,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.alreadyHaveAccount,
                    style: TextStyle(color: AppColors.whiteBloc, fontSize: 16),
                  ),
                  const SizedBox(width: 5),
                  CustomTextWidget(
                    text: AppStrings.loginInstead,
                    fontSize: 16,
                    color: AppColors.secnderyColor,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
