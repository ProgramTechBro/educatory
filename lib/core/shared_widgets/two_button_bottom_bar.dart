import 'package:flutter/material.dart';
import '../../config/app_colors.dart';
import '../../config/app_typography.dart';
import 'app_button.dart';

class TwoButtonBottomBar extends StatelessWidget {
  final String? leadingLabel;
  final VoidCallback? onLeadingTap;
  final String trailingLabel;
  final VoidCallback? onTrailingTap;
  final IconData? trailingIcon;

  const TwoButtonBottomBar({
    super.key,
    this.leadingLabel,
    this.onLeadingTap,
    required this.trailingLabel,
    required this.onTrailingTap,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(top: BorderSide(color: AppColors.neutral200)),
        ),
        child: Row(
          children: [
            if (leadingLabel != null) ...[
              Expanded(
                child: AppButton(
                  label: leadingLabel!,
                  variant: AppButtonVariant.outline,
                  height: 40,
                  onPressed: onLeadingTap,
                ),
              ),
              const SizedBox(width: 11),
            ],
            Expanded(
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: onTrailingTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    disabledBackgroundColor: AppColors.accent.withOpacity(0.4),
                    elevation: 0,
                    side: const BorderSide(color: AppColors.buttonGlassBorder),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (trailingIcon != null) ...[
                        Icon(trailingIcon, size: 20, color: AppColors.white),
                        const SizedBox(width: 8),
                      ],
                      Text(
                        trailingLabel,
                        style: AppTypography.bodyLargeMedium.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
