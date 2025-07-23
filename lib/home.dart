import 'package:flutter/material.dart';
import 'package:flutter_application_10/app_colors.dart';
import 'package:flutter_application_10/app_string.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/images/boy2.jpg', fit: BoxFit.cover),
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.whiteBloc.withOpacity(0.6),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
              child: Text(
                AppStrings.StartNow,
                style: TextStyle(fontSize: 18, color: AppColors.whiteApp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
