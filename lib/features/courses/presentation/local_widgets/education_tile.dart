import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../domain/entities/course_author_entity.dart';

class EducationTile extends StatelessWidget {
  final EducationEntryEntity entry;

  const EducationTile({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: entry.iconBackground,
                shape: BoxShape.circle,
              ),
              child: Icon(entry.icon, size: 20, color: AppColors.accent),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(entry.degree, style: AppTypography.bodyLargeMedium),
                Text(
                  entry.institution,
                  style: AppTypography.bodySmallRegular.copyWith(
                    color: AppColors.neutral500,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          entry.years,
          style: AppTypography.bodySmallMedium.copyWith(
            color: AppColors.neutral900,
          ),
        ),
      ],
    );
  }
}
