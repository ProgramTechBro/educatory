import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../domain/entities/course_author_entity.dart';

class CourseAuthorCard extends StatelessWidget {
  final CourseAuthorEntity author;

  const CourseAuthorCard({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: AppColors.inputDropShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  imageUrl: author.avatar,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(author.name, style: AppTypography.bodyLargeMedium),
                  const SizedBox(height: 2),
                  Text(
                    author.institution,
                    style: AppTypography.bodySmallRegular.copyWith(
                      color: AppColors.neutral500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 4,
                    ),
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
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '${author.rating} ',
                                style: AppTypography.bodySmallMedium.copyWith(
                                  color: AppColors.orange400,
                                ),
                              ),
                              TextSpan(
                                text: '(${author.ratingCount})',
                                style: AppTypography.bodySmallRegular
                                    .copyWith(color: AppColors.orange400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, color: AppColors.neutral200),
          const SizedBox(height: 12),
          Text(
            author.bio,
            style: AppTypography.bodySmallRegular.copyWith(
              color: AppColors.neutral600,
            ),
          ),
        ],
      ),
    );
  }
}
