import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';

class OnboardingActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isPrimary;

  const OnboardingActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isPrimary ? AppColors.accent : AppColors.secondaryButtonFill,
          elevation: 0,
          side: BorderSide(
            color: isPrimary ? AppColors.buttonGlassBorder : AppColors.primary,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          label,
          style: AppTypography.bodyLargeMedium.copyWith(
            color: isPrimary ? AppColors.white : AppColors.primary,
            height: 24 / 14,
          ),
        ),
      ),
    );
  }
}
