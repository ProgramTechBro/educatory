import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';

class HomeAppBar extends StatelessWidget {
  final VoidCallback onMenuTap;
  final int notificationCount;

  const HomeAppBar({
    super.key,
    required this.onMenuTap,
    this.notificationCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: onMenuTap,
          child: const Icon(Icons.menu, size: 24, color: AppColors.neutral900),
        ),
        Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.neutral300),
                    shape: BoxShape.circle,
                    boxShadow: AppColors.inputDropShadow,
                  ),
                  child: const Icon(
                    Icons.notifications_outlined,
                    size: 20,
                    color: AppColors.neutral900,
                  ),
                ),
                if (notificationCount > 0)
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      padding: const EdgeInsets.all(3.5),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.white, width: 2),
                      ),
                      constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                      child: Text(
                        '$notificationCount',
                        textAlign: TextAlign.center,
                        style: AppTypography.bodySmallMedium.copyWith(
                          fontSize: 11,
                          height: 1,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.neutral300),
                shape: BoxShape.circle,
                boxShadow: AppColors.inputDropShadow,
              ),
              child: const Icon(
                Icons.shopping_cart_outlined,
                size: 20,
                color: AppColors.neutral900,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
