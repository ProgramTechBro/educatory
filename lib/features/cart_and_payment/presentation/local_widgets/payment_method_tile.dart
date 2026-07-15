import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';

class PaymentMethodTile extends StatelessWidget {
  final Widget icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodTile({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: isSelected ? AppColors.otpFocusShadow : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              size: 20,
              color: isSelected ? AppColors.primary : AppColors.neutral300,
            ),
            const SizedBox(width: 8),
            icon,
            const SizedBox(width: 4),
            Text(
              label,
              style: AppTypography.bodyLargeRegular.copyWith(
                color: AppColors.neutral700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
