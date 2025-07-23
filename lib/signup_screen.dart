import 'package:flutter/material.dart';
import 'package:flutter_application_10/base%20screan.dart';
import 'package:flutter_application_10/signup_screen_content.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      showBackButton: true,
      child: SignUpScreenContent(
        onSwitchToLogin: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
