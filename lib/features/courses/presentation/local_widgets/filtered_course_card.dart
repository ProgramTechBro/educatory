import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../domain/entities/course_entity.dart';

class FilteredCourseCard extends StatelessWidget {
  final CourseEntity course;
  final VoidCallback onTap;

  const FilteredCourseCard({
    super.key,
    required this.course,
    required this.onTap,
  });

  ({String label, Color color}) get _badge {
    switch (course.badge) {
      case CourseBadgeType.topAuthor:
        return (label: 'Top Author', color: AppColors.purple100);
      case CourseBadgeType.editorsChoice:
        return (label: "Editor's Choice", color: AppColors.green100);
      case CourseBadgeType.bestseller:
        return (label: 'Bestseller', color: AppColors.pink100);
      case CourseBadgeType.mostPopular:
        return (label: 'Most Popular', color: AppColors.blue100);
    }
  }

  @override
  Widget build(BuildContext context) {
    final badge = _badge;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              course.image,
              width: 144,
              height: 124,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  course.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.bodyLargeMedium,
                ),
                Text(
                  '${course.author} · ${course.duration}',
                  style: AppTypography.bodySmallRegular.copyWith(
                    color: AppColors.neutral700,
                  ),
                ),
                const SizedBox(height: 8),
                const Divider(height: 1, color: AppColors.neutral200),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$${course.price.toStringAsFixed(2)}',
                          style: AppTypography.bodyLargeMedium,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '\$${course.originalPrice.toStringAsFixed(0)}',
                          style: AppTypography.bodySmallRegular,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: AppColors.orange500,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${course.rating} (${NumberFormat('#,###').format(course.ratingCount)})',
                          style: AppTypography.bodySmallRegular.copyWith(
                            color: AppColors.neutral900,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: badge.color,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    badge.label,
                    style: AppTypography.bodySmallRegular.copyWith(
                      color: AppColors.neutral800,
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
