import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';

class RequestCourseCard extends StatelessWidget {
  final VoidCallback onTap;

  const RequestCourseCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: 157,
        height: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.neutral200,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.add_circle_outline,
              size: 24,
              color: AppColors.neutral500,
            ),
            const SizedBox(height: 8),
            Text(
              'Request a Course',
              textAlign: TextAlign.center,
              style: AppTypography.bodyLargeMedium.copyWith(
                color: AppColors.neutral500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
