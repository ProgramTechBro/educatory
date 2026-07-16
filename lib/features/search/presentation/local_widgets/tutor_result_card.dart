import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../../../core/shared_widgets/network_avatar.dart';
import '../../domain/entities/tutor_result_entity.dart';

class TutorResultCard extends StatelessWidget {
  final TutorResultEntity tutor;
  final VoidCallback onTap;

  const TutorResultCard({super.key, required this.tutor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.neutral300),
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppColors.inputDropShadow,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NetworkAvatar(imageUrl: tutor.avatar, size: 48),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(tutor.name, style: AppTypography.bodyLargeMedium),
                  Text(
                    tutor.institution,
                    style: AppTypography.bodySmallRegular.copyWith(
                      color: AppColors.neutral600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF7ED),
                      border: Border.all(color: AppColors.orange400),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: AppColors.orange400,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${tutor.rating} (${tutor.ratingCount})',
                          style: AppTypography.bodySmallRegular.copyWith(
                            color: AppColors.orange400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '\$${tutor.hourlyRate.toStringAsFixed(0)}',
                        style: AppTypography.bodyLargeMedium.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      TextSpan(
                        text: '/hr',
                        style: AppTypography.bodyLargeRegular.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '\$${tutor.originalHourlyRate.toStringAsFixed(0)}',
                  style: AppTypography.bodySmallRegular.copyWith(
                    color: AppColors.neutral500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
