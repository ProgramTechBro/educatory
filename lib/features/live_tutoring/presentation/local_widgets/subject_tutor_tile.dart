import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../domain/entities/tutor_entity.dart';

class SubjectTutorTile extends StatelessWidget {
  final TutorEntity tutor;
  final VoidCallback onTap;

  const SubjectTutorTile({super.key, required this.tutor, required this.onTap});

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
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppColors.inputDropShadow,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: tutor.avatar,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              ),
            ),
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
                    text: '/hr ',
                    style: AppTypography.bodyLargeRegular.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  TextSpan(
                    text: '\$${tutor.originalHourlyRate.toStringAsFixed(0)}',
                    style: AppTypography.bodySmallRegular,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
