import 'package:flutter/material.dart';
import '../app_typography.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme get textTheme {
    return const TextTheme(
      titleLarge: AppTypography.h3SemiBold,
      titleMedium: AppTypography.h4SemiBold,
      titleSmall: AppTypography.h4Medium,
      bodyLarge: AppTypography.bodyLargeRegular,
      bodyMedium: AppTypography.bodyLargeMedium,
      labelLarge: AppTypography.bodyLargeSemiBold,
      bodySmall: AppTypography.bodySmallRegular,
      labelSmall: AppTypography.bodySmallMedium,
    );
  }
}
