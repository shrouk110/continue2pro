import 'package:flutter/material.dart';
import 'package:flutter_application_10/CustomText.dart';
import 'package:flutter_application_10/app_colors.dart';
import 'package:flutter_application_10/app_string.dart';
import 'package:flutter_application_10/base%20screan.dart';
import 'package:flutter_application_10/homeListView.dart';
import 'login_screen_conent.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      containerHeight: 430,
      showBackButton: true,
      child: Column(
        children: [
          CustomTextWidget(
            text: AppStrings.loginButtonText,
            fontSize: 24,
            color: AppColors.mainColor,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 20),
          LoginScreenContent(
            onSwitchToSignUp: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SignUpScreen()),
              );
            },
            onLoginPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => CartPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
