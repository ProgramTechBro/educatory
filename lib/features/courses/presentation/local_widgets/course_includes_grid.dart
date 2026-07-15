import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../domain/entities/course_detail_entity.dart';

class CourseIncludesGrid extends StatelessWidget {
  final List<CourseIncludeEntity> includes;

  const CourseIncludesGrid({super.key, required this.includes});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: AppColors.inputDropShadow,
      ),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          for (final include in includes)
            SizedBox(
              width: 140,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(include.icon, size: 20, color: AppColors.neutral700),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      include.label,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.neutral700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
