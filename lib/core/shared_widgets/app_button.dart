import 'package:flutter/material.dart';
import '../../config/app_colors.dart';
import '../../config/app_typography.dart';

enum AppButtonVariant { primary, secondary, outline }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final double height;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.height = 44,
  });

  Color get _backgroundColor {
    switch (variant) {
      case AppButtonVariant.primary:
        return AppColors.accent;
      case AppButtonVariant.secondary:
        return AppColors.secondaryButtonFill;
      case AppButtonVariant.outline:
        return AppColors.white;
    }
  }

  Color get _borderColor {
    switch (variant) {
      case AppButtonVariant.primary:
        return AppColors.buttonGlassBorder;
      case AppButtonVariant.secondary:
        return AppColors.primary;
      case AppButtonVariant.outline:
        return AppColors.neutral300;
    }
  }

  Color get _textColor {
    switch (variant) {
      case AppButtonVariant.primary:
        return AppColors.white;
      case AppButtonVariant.secondary:
        return AppColors.primary;
      case AppButtonVariant.outline:
        return AppColors.neutral600;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _backgroundColor,
          disabledBackgroundColor: variant == AppButtonVariant.primary
              ? AppColors.accent.withOpacity(0.4)
              : _backgroundColor,
          elevation: 0,
          side: BorderSide(color: _borderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          label,
          style: AppTypography.bodyLargeMedium.copyWith(color: _textColor),
        ),
      ),
    );
  }
}
