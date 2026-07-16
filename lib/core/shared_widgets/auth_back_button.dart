import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/app_colors.dart';
import '../../config/app_typography.dart';

class AuthBackButton extends StatelessWidget {
  const AuthBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (!context.canPop()) return const SizedBox.shrink();

    return InkWell(
      onTap: () => context.pop(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.chevron_left,
            size: 20,
            color: AppColors.neutral900,
          ),
          Text(
            'Back',
            style: AppTypography.bodyLargeRegular.copyWith(
              color: AppColors.neutral900,
            ),
          ),
        ],
      ),
    );
  }
}
