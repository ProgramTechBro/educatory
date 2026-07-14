import 'package:flutter/material.dart';

class OnboardingIllustration extends StatelessWidget {
  final String imagePath;

  const OnboardingIllustration({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Image.asset(imagePath, fit: BoxFit.contain),
      ),
    );
  }
}
