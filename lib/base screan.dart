import 'package:flutter/material.dart';
import 'package:flutter_application_10/app_colors.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  final double containerHeight;
  final bool showBackButton;
  final double imageBottomPadding;

  const BaseScreen({
    super.key,
    required this.child,
    this.containerHeight = 350,
    this.showBackButton = false,
    this.imageBottomPadding = 150,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.whiteApp,
      body: Stack(
        children: [
          SizedBox(
            height: screenHeight,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(bottom: imageBottomPadding),
              child: Image.asset(
                'assets/images/boy.jpg',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),

          Container(
            height: screenHeight,
            width: double.infinity,
            color: Colors.black.withOpacity(0.2),
          ),

          if (showBackButton)
            Positioned(
              top: 40,
              left: 16,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: containerHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.whiteApp,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.whiteBloc,
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
