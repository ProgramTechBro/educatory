import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../domain/entities/course_module_entity.dart';

class CourseModuleTile extends StatelessWidget {
  final CourseModuleEntity module;
  final VoidCallback onTap;
  final bool isActive;

  const CourseModuleTile({
    super.key,
    required this.module,
    required this.onTap,
    this.isActive = false,
  });

  IconData get _icon {
    switch (module.type) {
      case CourseModuleType.video:
        return Icons.play_arrow;
      case CourseModuleType.reading:
        return Icons.description_outlined;
      case CourseModuleType.assignment:
        return Icons.lightbulb_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(
            color: isActive ? AppColors.primary : AppColors.neutral300,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: AppColors.inputDropShadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (module.isCompleted)
                  const Icon(
                    Icons.check_circle,
                    size: 24,
                    color: AppColors.green500,
                  )
                else if (module.type == CourseModuleType.video)
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.fromBorderSide(
                        BorderSide(color: AppColors.neutral300),
                      ),
                    ),
                    child: Icon(_icon, size: 16, color: AppColors.neutral700),
                  )
                else
                  Icon(_icon, size: 24, color: AppColors.neutral700),
                const SizedBox(width: 8),
                Text(
                  module.title,
                  style: AppTypography.bodyLargeMedium.copyWith(
                    color: AppColors.neutral900,
                    decoration: module.isCompleted
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
              ],
            ),
            Text(
              module.meta,
              style: AppTypography.bodySmallMedium.copyWith(
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
