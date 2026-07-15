import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';

class OrderSummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool emphasize;

  const OrderSummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.emphasize = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTypography.bodyLargeRegular.copyWith(
            color: AppColors.neutral500,
          ),
        ),
        Text(
          value,
          style: emphasize
              ? AppTypography.h3SemiBold
              : AppTypography.bodyLargeMedium,
        ),
      ],
    );
  }
}
