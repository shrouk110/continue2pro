import 'package:flutter/material.dart';
import 'package:flutter_application_10/CustomText.dart';
import 'package:flutter_application_10/app_colors.dart';
import 'package:flutter_application_10/app_string.dart';
import 'package:flutter_application_10/textfield.dart';

class LoginScreenContent extends StatefulWidget {
  final VoidCallback onSwitchToSignUp;
  final VoidCallback onLoginPressed;

  const LoginScreenContent({
    super.key,
    required this.onSwitchToSignUp,
    required this.onLoginPressed,
  });

  @override
  State<LoginScreenContent> createState() => _LoginScreenContentState();
}

class _LoginScreenContentState extends State<LoginScreenContent> {
  final _formKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextWidget(
            text: AppStrings.loginScreenWelcomeText,
            color: AppColors.mainColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 50),

          CustomTextField(
            label: AppStrings.loginScreenPhonenumberTextFiled,
            controller: phoneController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Phone number is required';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),

          CustomTextField(
            label: AppStrings.loginScreenPasswordTextFiled,
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
          const SizedBox(height: 25),

          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget
                    .onLoginPressed(); // انتقل للصفحة التالية فقط لو البيانات صحيحة
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainColor,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: CustomTextWidget(
              text: AppStrings.loginButtonText,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteBloc,
            ),
          ),
          const SizedBox(height: 15),

          GestureDetector(
            onTap: widget.onSwitchToSignUp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextWidget(
                  text: AppStrings.noAccountText,
                  color: AppColors.whiteBloc,
                  fontSize: 16,
                ),
                const SizedBox(width: 5),
                CustomTextWidget(
                  text: AppStrings.createAccountText,
                  color: AppColors.secnderyColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
