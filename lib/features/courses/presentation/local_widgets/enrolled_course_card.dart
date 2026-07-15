import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../../../core/shared_widgets/course_progress_bar.dart';
import '../../domain/entities/enrolled_course_entity.dart';

enum EnrolledCourseAction { playNow, rateCourse, report }

class EnrolledCourseCard extends StatelessWidget {
  final EnrolledCourseEntity course;
  final VoidCallback onTap;
  final ValueChanged<EnrolledCourseAction> onAction;

  const EnrolledCourseCard({
    super.key,
    required this.course,
    required this.onTap,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              course.image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        course.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.bodyLargeMedium,
                      ),
                    ),
                    PopupMenuButton<EnrolledCourseAction>(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.more_vert,
                        size: 20,
                        color: AppColors.neutral600,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      onSelected: onAction,
                      itemBuilder: (context) => const [
                        PopupMenuItem(
                          value: EnrolledCourseAction.playNow,
                          child: Text('Play Now'),
                        ),
                        PopupMenuItem(
                          value: EnrolledCourseAction.rateCourse,
                          child: Text('Rate Course'),
                        ),
                        PopupMenuItem(
                          value: EnrolledCourseAction.report,
                          child: Text('Report'),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  '${course.author} · ${course.duration}',
                  style: AppTypography.bodySmallRegular.copyWith(
                    color: AppColors.neutral700,
                  ),
                ),
                const SizedBox(height: 8),
                CourseProgressBar(progress: course.progress, height: 8),
                const SizedBox(height: 4),
                Text(
                  '${(course.progress * 100).round()}% Complete',
                  style: AppTypography.bodySmallRegular.copyWith(
                    color: AppColors.neutral500,
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
