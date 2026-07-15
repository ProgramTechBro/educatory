import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../domain/entities/course_entity.dart';

class CourseDetailHeaderCard extends StatelessWidget {
  final CourseEntity course;

  const CourseDetailHeaderCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: AppColors.inputDropShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              course.image,
              width: double.infinity,
              height: 152,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Text(course.title, style: AppTypography.h4Medium),
          Text(
            '${course.author} · ${course.duration}',
            style: AppTypography.bodySmallRegular.copyWith(
              color: AppColors.neutral700,
            ),
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, color: AppColors.neutral200),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.purple100,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Top Author',
                  style: AppTypography.bodySmallRegular.copyWith(
                    color: AppColors.neutral800,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, size: 12, color: AppColors.orange500),
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
        ],
      ),
    );
  }
}
